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
    @token.present? && @token.size >= 10
  end
end
