require 'savon'
require 'iformat/session'
require 'iformat/error'

module IFormat

  class Client
    attr_accessor *IFormat::Config::VALID_OPTIONS_KEYS

    def initialize(options = {})
      options = IFormat.options.merge(options)

      IFormat::Config::VALID_OPTIONS_KEYS.each do |key|
        instance_variable_set("@#{key}".to_sym, options[key])
      end
    end

    require 'iformat/client/session'
    include IFormat::Client::Session

    require 'iformat/client/products'
    include IFormat::Client::Products

    require 'iformat/client/orders'
    include IFormat::Client::Orders

    protected

    def request(method, params = {}, options = {})
      response = soap_client.request(method) do
        http.auth.ssl.verify_mode = :none
        soap.body = params unless params.nil? || params.empty?
      end

      res    = response.body["#{method}_response".to_sym]["#{method}_result".to_sym]
      status = res[:status].to_i
      msg    = res[:msg]

      if status < 1
        raise new IFormat::Error(msg, status)
      end

      options[:raw] ? response : res[:result]
    end

    def session_request(method, params = {}, options = {})
      begin
        request(method, params.merge('sessionID' => current_session.id), options)
      rescue IFormat::Error
        request(method, params.merge('sessionID' => current_session(:refresh).id), options)
      end
    end

    private

    def current_session(refresh = false)
      @current_session = get_session if @current_session.nil? || refresh
      @current_session
    end

    def soap_client
      @soap_client ||= Savon::Client.new(wsdl)
    end

  end

end