module IFormat

  class Client

    attr_accessor *IFormat::Config::VALID_OPTIONS_KEYS

    def initialize(options = {})
      options = IFormat.options.merge(options)
      IFormat::Config::VALID_OPTIONS_KEYS.each do |key|
        instance_variable_set("@#{key}".to_sym, options[key])
      end
    end

  end

end