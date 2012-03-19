require 'iformat/base'

module IFormat

  class Order < IFormat::Base
    lazy_attr_reader :order_id, :date, :price, :items

    def id
      @id ||= @attrs[:order_id]
    end

    def created_at
      @created_at ||= @attrs[:date]
    end

    def net_amount
      @net_amount ||= BigDecimal.new(@attrs[:price] || '0')
    end

    # @param other [IFormat::Order]
    # @return [Boolean]
    def ==(other)
      super || (other.class == self.class && other.id == self.id)
    end

  end

end
