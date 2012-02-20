require 'iformat/base'

module IFormat

  class Order < IFormat::Base
    lazy_attr_reader :order_id, :items

    def id
      @id ||= @attrs[:order_id]
    end

    def items
      @items ||= []
    end

    # @param other [IFormat::Order]
    # @return [Boolean]
    def ==(other)
      super || (other.class == self.class && other.id == self.id)
    end

  end

end
