require 'iformat/order'
require 'iformat/order_item'

module IFormat

  class Client

    module Orders

      def create_order(id, items)
        attrs = session_request(:create_order, {
            'orderID' => id,
            'items'   => {
                'iFSCreateOrderReq' => items
            }
        })
      end

      def get_order_info(id)
        attrs = session_request(:get_order_info, {
            'orderID' => id
        })

        attrs[:items] = Array.wrap(attrs.delete(:items)[:i_fs_item]).map do |item_attrs|
          item_attrs[:urls] = Array.wrap(item_attrs.delete(:content)[:string])
          IFormat::OrderItem.new(item_attrs)
        end

        IFormat::Order.new(attrs)
      end

      def repeat_order(id)
        get_order_info(id)
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