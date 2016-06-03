class UsersController <ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      #flash
      redirect_to families_path
    else
      #flash
      render :new
    end

  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
