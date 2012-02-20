require 'iformat/base'

module IFormat

  class OrderItem < IFormat::Base
    lazy_attr_reader :product_id, :issue_id, :type_id

    def type
      @type ||= @attrs[:type_id]
    end

    # @param other [IFormat::OrderItem]
    # @return [Boolean]
    def ==(other)
      super || (other.class == self.class && other.product_id == self.product_id && other.issue_id == self.issue_id && other.type_id == self.type_id)
    end

  end

end
