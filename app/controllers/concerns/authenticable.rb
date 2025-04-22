module Authenticable
  private

  def authenticate_with_token
    @token ||= request.headers["Authorization"]&.split(" ")&.last

    unless valid_token?
      render json: { error: "Unauthorized" }, status: :unauthorized
      nil
    end
  end

  def valid_token?
    @token.present? && @token == Rails.application.credentials.token
  end
end
