class Admin::SupplyItemsController <Admin::BaseController

  def edit
    @family = Family.find(params[:family_id])
    @supply_items = @family.supply_items.all
  end

  def update
    @family = Family.find(params[:family_id])
    @supply_item = SupplyItem.find(params[:id])
    @supply_item.update(supply_item_params)
    flash[:notice] = "Supply item updated successfully"
    redirect_to admin_family_path(@family)

  end


  def supply_item_params
    params.require(:supply_item).permit(:quantity, :status)
  end





end
