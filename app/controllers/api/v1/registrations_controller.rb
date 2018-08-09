# frozen_string_literal: true

# Controller for registration
class Api::V1::RegistrationsController < Devise::RegistrationsController
  private

  def sign_up_params
    params.require(:user).permit(:username, :email, :password,
                                 :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:username, :last_name, :email, :password,
                                 :password_confirmation, :current_password)
  end
end