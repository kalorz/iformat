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

      def get_items_history
        raise NotImplementedError
      end

    end

  end

end