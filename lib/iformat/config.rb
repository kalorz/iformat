require 'iformat/version'

module IFormat

  # Defines constants and methods related to configuration
  module Config

    # The WSDL URL that will be used to connect if none is set
    DEFAULT_WSDL = 'http://wsdl.iformat.pl/api.xml'

    # The API usersname if none is set
    DEFAULT_USERNAME = nil

    # The API password if none is set
    DEFAULT_PASSWORD = nil

    # An array of valid keys in the options hash when configuring a {IFormat::Client}
    VALID_OPTIONS_KEYS = [
        :wsdl,
        :username,
        :password
    ]

    attr_accessor *VALID_OPTIONS_KEYS

    # When this module is extended, set all configuration options to their default values
    def self.extended(base)
      base.reset
    end

    # Convenience method to allow configuration options to be set in a block
    def configure
      yield self
      self
    end

    # Create a hash of options and their values
    def options
      options = {}
      VALID_OPTIONS_KEYS.each{ |k| options[k] = send(k) }
      options
    end

    # Reset all configuration options to defaults
    def reset
      self.wsdl     = DEFAULT_WSDL
      self.username = DEFAULT_USERNAME
      self.password = DEFAULT_PASSWORD
    end

  end

end