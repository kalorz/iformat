require 'iformat/error/authorization_error'

module IFormat

  class Error::BadUsernameOrPasswordOrPasswordsDifferent < IFormat::Error::AuthorizationError
  end

end
