class Api::V1::UsersController < Api::V1::ApiController
  def create
    file = user_params[:data]
    @users = Parser::CSVParser.parse file
  end

  private
    def user_params
      params.require(:users).permit :data
    end
end
