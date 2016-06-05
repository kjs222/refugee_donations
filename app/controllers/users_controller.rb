class UsersController <ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:alert] = "Account Created.  Please login."
      redirect_to login_path
    else
      flash.now[:error] = @family.errors.full_messages.join(", ")
      render :new
    end
  end

  def show
    @user = current_user
  end



  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
