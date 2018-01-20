class Users::RegistrationsController < Devise::RegistrationsController
  def create
    super
    UserMailer.sign_up_confirmation_email(@user).deliver_now if @user.persisted?
  end

  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password)
  end
end
