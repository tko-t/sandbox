module ErrorResponse
  extend ActiveSupport::Concern

  included do
    rescue_from StandardError, with: :unknown_error
    rescue_from ActiveRecord::RecordInvalid, with: :invalid_error
    rescue_from SB::BaseError, with: :render_error
  end

  def unknown_error(error)
    render_error(SB::BaseError.new(error_message: error.message, error_code: :unknown, http_status: 500))
  end

  def invalid_error(error)
    render_error(SB::BaseError.new(error_message: error.message, error_code: :invalid, http_status: 422))
  end

  def render_error(error)
    render json: { code: error.code, message: error.message }, status: error.status
  end
end
