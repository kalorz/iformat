require 'savon'
require 'iformat/configuration'
require 'iformat/error'
require 'iformat/error/bad_session_id'
require 'iformat/session'

module IFormat

  class Client
    attr_accessor *IFormat::Configuration::VALID_OPTIONS

    def initialize(options = {})
      IFormat::Configuration::VALID_OPTIONS.each do |key|
        send("#{key}=", options.has_key?(key) ? options[key] : IFormat.config[key])
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
        case status
          when IFormat::Error::BAD_SESSION_ID_STATUS
            raise IFormat::Error::BadSessionId.new(msg, status)
          else
            raise IFormat::Error.new(msg, status)
        end

      end

      options[:raw] ? response : res[:result]
    end

    def session_request(method, params = {}, options = {})
      begin
        request(method, params.merge('sessionID' => current_session.id), options)
      rescue IFormat::Error::BadSessionId
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