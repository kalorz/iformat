require 'iformat/error/authorization_error'

module IFormat

  class Error::BadSessionId < IFormat::Error::AuthorizationError
  end

end
