require 'iformat/base'

module IFormat

  class Category < IFormat::Base
    lazy_attr_reader :url, :catid, :mtime, :title

    def id
      @id ||= @attrs[:catid].to_i
    end

    def updated_at
      @updated_at ||= @attrs[:mtime]
    end

    # @param other [IFormat::Category]
    # @return [Boolean]
    def ==(other)
      super || (other.class == self.class && other.id == self.id)
    end

  end

end
