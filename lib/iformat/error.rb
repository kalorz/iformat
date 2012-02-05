module IFormat

  # Error class for rescuing from all IFormat errors
  class Error < StandardError
    UNKNOWN_ERROR_STATUS                                   = 0
    INTERNAL_ERROR_STATUS                                  = -1
    BAD_SESSION_ID_STATUS                                  = -101
    BAD_USERNAME_OR_PASSWORD_STATUS                        = -102
    BAD_USERNAME_OR_PASSWORD_OR_PASSWORDS_DIFFERENT_STATUS = -103
    ORDER_ALREADY_EXISTS_STATUS                            = -1001
    HEADER_ERROR_STATUS                                    = -1002
    ITEM_ERROR_STATUS                                      = -1003
    LOGO_ERROR_STATUS                                      = -1004
    RESULT_TOO_BIG_STATUS                                  = -1005
    INSERT_COIN_STATUS                                     = -1006
    NOT_ALL_LINES_HAVE_LINKS_STATUS                        = -1012
    ORDER_NOT_FOUND_STATUS                                 = -1013
    ORDER_DELETED_FROM_SYSTEM_STATUS                       = -1014
    ORDER_CLOSED_NO_LINKS_GENERATED_STATUS                 = -1015
    ORDER_WAITING_FOR_LINKS_STATUS                         = -1016

    attr_reader :status

    def initialize(message, status = 0)
      @status = status
      super(message)
    end

  end

end