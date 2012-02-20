require 'iformat/category'

module IFormat

  class Client

    module Products

      def get_products
        products_attrs = session_request(:get_products)

        products_attrs[:products_n][:i_fs_product].map do |attrs|
          IFormat::Category.new(attrs)
        end
      end

      def get_items_history(since)
        since = since.xmlschema if since.respond_to?(:xmlschema)

        attrs = session_request(:get_items_history, {
            :date => since
        })

        attrs[:result]
      end

    end

  end

end