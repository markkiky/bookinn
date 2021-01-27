class AuthenticationController < ApplicationController

  # post /auth/login
  def login
    @user = User.find_by_email(params[:email])
    if @user == nil
      render json: {
               status: 400,
               message: "User not found",
               access_token: nil,
               exp: nil,
               data: nil,
             }
    else
      @user_response = {
        id: @user.id,
        username: @user.username,
        role_id: @user.role_id,
        role: Role.find_by(:id => @user.role_id) ? Role.find_by(:id => @user.role_id).role_description : "Role is not defined",
        email: @user.email,
      }
      if @user&.authenticate(params[:password])
        token = JsonWebToken.encode(user_id: @user.id)
        time = Time.now + 24.hours.to_i
        render json: {
                 status: 200,
                 access_token: token,
                 exp: time,
                 data: @user_response,
               },
               status: :ok
      else
        render json: { status: 200, error: "Failed to authenticate user" }, status: :unauthorized
      end
    end
  end

  # post /password/forgot
  def forgot
    # Check for a blank email
    if params[:email].blank?
      response = {
        status: 400,
        error: "Email is required",
      }
      return render json: response
    end
    # check if specified email exists
    @user = User.find_by(email: params[:email])
    if @user.present?
      # send email with reset password token
      @user.generate_password_token!

      response = {
        status: 200,
        message: "Reset Password Token sent",
        token: @user.reset_password_token,
      }
      render json: response
    else
      #  user with the specified email not found try with another email
      response = {
        status: 400,
        error: "Email not found",
      }
      render json: response
    end
  end

  # post /password/reset
  def reset
    token = params[:token].to_s
    # Check for empty params
    if params[:email].blank? || params[:password].blank? || params[:token].blank?
      response = {
        status: 400,
        error: "Email, Password and Token are required to reset password",
      }
      return render json: response
    end
    @user = User.find_by(reset_password_token: token)
    if @user.present? && @user.password_token_valid?
      @user.update(reset_password_params)
      response = {
        status: 200,
        message: "Password reset successful. Proceed to login",
      }
      render json: response
    else
      response = {
        status: 400,
        error: "Invalid Password Token",
      }
      render json: response
    end
  end

  private

  def login_params
    params.permit(:email, :password)
  end

  def reset_password_params
    params.permit(:email, :password, :reset_password_token)
  end
end
