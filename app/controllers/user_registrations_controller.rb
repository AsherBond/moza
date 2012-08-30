class UserRegistrationsController < Devise::RegistrationsController
  def new
   # render :layout => "signup"
  end
  def edit
    @user = current_user
  end

  def update
    if current_user.update_without_password(params[:user])
      # Sign in the user bypassing validation in case his password changed
      sign_in current_user, :bypass => true
      flash[:notice] = "Successfully updated account."
      redirect_to current_user
    else
      render "edit"
    end
  end

end