require 'iformat/client'
require 'iformat/configuration'
require 'iformat/version'

module IFormat

  # Alias for IFormat::Client.new
  #
  # @return [IFormat::Client]
  def self.new(options = {})
    IFormat::Client.new(options)
  end

  def self.configure(&block)
    return unless block_given?

    yield Configuration.instance
  end

  def self.config
    Configuration.instance
  end

  # Delegate to IFormat::Client
  def self.method_missing(method, *args, &block)
    return super unless new.respond_to?(method)

    new.send(method, *args, &block)
  end

  def self.respond_to?(method, include_private = false)
    new.respond_to?(method, include_private) || super(method, include_private)
  end

end
