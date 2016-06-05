class Admin::FamiliesController <Admin::BaseController

  def new
    @family = Family.new
  end

  def show
    @family = Family.find(params[:id])
    @supply_items = @family.supply_items
  end

  def create
    @family = Family.new(family_params)
    if @family.save
      flash[:notice] = "Family created successfully.  Please review supply list"
      @family.create_supply_items
      redirect_to admin_family_path(@family)
    else
      flash.now[:error] = @family.errors.full_messages.join(", ")
      render :new
    end
  end

  def edit
    @family = Family.find(params[:id])
  end

  def update
    @family = Family.find(params[:id])
    if @family.update(family_params)
      flash[:notice] = "Family updated successfully. Please review supply list."
      redirect_to admin_family_path(@family)
    else
      flash.now[:error] = @family.errors.full_messages.join(", ")
      render :edit
    end
  end

  def destroy
    @family = Family.find(params[:id])
    @family.destroy
    flash[:notice] = "Family deleted"
    redirect_to families_path
  end

  private

  def family_params
    params.require(:family).permit(:first_name, :last_name, :address, :arrival_date, :nationality, :description, :num_married_adults, :num_non_married_adults, :num_children_over_two, :num_children_under_two)
  end

end
