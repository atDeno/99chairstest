class Api::V1::ApiController < ActionController::Base
  before_action :authorize_user

  def authorize_user
    error_json 'Unauthorized, Please contact to the vendor.',
      401 and return unless request.headers[:HTTP_ACCESS_TOKEN] == ENV['ACCESS_TOKEN']
  end

  def error_json message, status
    render json: { error: message }, status: status
  end

  def success_json message
    render json: { success: message }, status: 200
  end
end
