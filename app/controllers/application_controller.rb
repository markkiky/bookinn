class ApplicationController < ActionController::API
  require "bcrypt"
  require "jwt"

  def authorize_request
    header = request.headers["Authorization"]
    header = header.split(" ").last if header

    begin
      @decoded = JsonWebToken.decode(header)
      @current_user = User.find(@decoded[:user_id])
    rescue ActiveRecord::RecordNotFound => e
      render json: {
               status: 404,
               message: "Access Token valid, But owner user does not exist",
               errors: e.message,
             },
             status: :unauthorized
    rescue JWT::DecodeError => e
      render json: {
               status: 401,
               message: "UnAuthorized",
               errors: e.message,
             }, status: :unauthorized
    end
  end

  def execute_statement(sql)
    results = ActiveRecord::Base.connection.execute(sql)

    if results.present?
      return results
    else
      return nil
    end
  end
end
