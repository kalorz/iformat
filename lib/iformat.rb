require 'iformat/version'
require 'iformat/config'
require 'iformat/client'

module IFormat
  extend IFormat::Config

  class << self

    # Alias for IFormat::Client.new
    #
    # @return [IFormat::Client]
    def new(options = {})
      IFormat::Client.new(options)
    end

    # Delegate to IFormat::Client
    def method_missing(method, *args, &block)
      return super unless new.respond_to?(method)

      new.send(method, *args, &block)
    end

    def respond_to?(method, include_private = false)
      new.respond_to?(method, include_private) || super(method, include_private)
    end

  end

end
