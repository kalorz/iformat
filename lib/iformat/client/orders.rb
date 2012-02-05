module IFormat

  class Client

    module Orders

      def create_order
        raise NotImplementedError
      end

      def get_order_info
        raise NotImplementedError
      end

      def repeat_order
        raise NotImplementedError
      end

      def get_orders_history
        raise NotImplementedError
      end

      def get_orders_history_quantity
        raise NotImplementedError
      end

    end

  end

end