require 'singleton'

module IFormat

  # Defines constants and methods related to configuration
  class Configuration
    include Singleton

    # The WSDL URL that will be used to connect if none is set
    DEFAULT_WSDL = 'http://wsdl.iformat.pl/api.xml'

    # The API usersname if none is set
    DEFAULT_USERNAME = nil

    # The API password if none is set
    DEFAULT_PASSWORD = nil

    # An array of valid keys in the options hash when configuring a {IFormat::Client}
    VALID_OPTIONS = [
        :wsdl,
        :username,
        :password
    ]

    attr_accessor *VALID_OPTIONS

    def initialize
      reset!
      super
    end

    def [](key)
      send key
    end

    private

    # Reset all configuration options to defaults
    def reset!
      self.wsdl     = DEFAULT_WSDL
      self.username = DEFAULT_USERNAME
      self.password = DEFAULT_PASSWORD
    end

  end

end