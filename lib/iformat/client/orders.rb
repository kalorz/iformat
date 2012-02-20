module IFormat

  class Client

    module Orders

      def create_order(id, items)
        attrs = session_request(:create_order, {
            'orderID' => id,
            'items'   => {
                'iFSCreateOrderReq' => items.map(&:to_hash)
            }
        })
      end

      def get_order_info(id)
        attrs = session_request(:get_order_info, {
            'orderID' => id
        })
      end

      def repeat_order
        raise NotImplementedError
      end

      def get_orders_history(start = 0, limit = 5)
        attrs = session_request(:get_orders_history, {
            'start' => start,
            'limit' => limit
        })
      end

      def get_orders_history_quantity
        attrs = session_request(:get_orders_history_quantity)

        attrs[:quantity].to_i
      end

    end

  end

end