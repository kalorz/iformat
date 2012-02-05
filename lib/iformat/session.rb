require 'iformat/base'

module IFormat

  class Session < IFormat::Base
    lazy_attr_reader :session_id, :timeout

    def id
      @id ||= @attrs[:session_id]
    end

    # @param other [IFormat::Session]
    # @return [Boolean]
    def ==(other)
      super || (other.class == self.class && other.id == self.id)
    end

  end

end
