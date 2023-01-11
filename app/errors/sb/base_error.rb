module SB
  class BaseError < StandardError
    attr_accessor :code, :status

    def initialize(error_message: nil, error_code: nil, http_status: nil)
      super(error_message || self.error_message)

      @code   = error_code  || self.error_code || :unknown
      @status = http_status || self.http_status || 500
    end

    def error_message
      I18n.t(['ed', 'errors', self._key || self.class.class_name.underscore].join('.'))
    end

    def _key; end

    def error_code; end

    def http_status; end
  end
end
