require 'iformat/session'

module IFormat

  class Client

    module Session

      def get_session
        attrs = request(:get_session, {:username => username, :password => password})

        IFormat::Session.new(attrs)
      end

    end

  end

end