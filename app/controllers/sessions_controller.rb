class SessionsController <ApplicationController

  def new

  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:alert] = "Login successful"
      redirect_to user_path(user)
    else
      flash.now[:error] = "Invalid login.  Try again"
      render :new
    end

  end


  def destroy
    flash[:alert] = "Logout successful"
    session.clear
    redirect_to login_path
  end


end
