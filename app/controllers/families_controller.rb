class FamiliesController < ApplicationController
# you can look into scoping this down the current user by creating a before action for
# the current user.
#so instead of having the if/else statement in the families to take care of the current_user
# you can deal with it as the user visits your page.
# --------------------------

  #before_action :require_authenticated_user

  #def require_authenticated_user
    #redirect_to login_path flash[:login] ="Must Login" unless current_user
  #end

# --------------------------
  def index
    @families = Family.to_arrive
  end

  def show
    @family = Family.find(params[:id])
  end

end
