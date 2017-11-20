module ControllerHelper
  ACCESS_TOKEN = { 'HTTP_ACCESS_TOKEN' => ENV['ACCESS_TOKEN'] }
  USERS_PATH = "/api/v1/users/"

  def create_users params
    post "#{USERS_PATH}", params: params, headers: ACCESS_TOKEN
  end
end
