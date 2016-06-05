class SupplyItemsController <ApplicationController

  def update
    @family = Family.find(params[:family_id])
    @supply_item = SupplyItem.find(params[:id])
    @supply_item.status = "Pledged"
    @supply_item.user = current_user
    @supply_item.save
    flash[:alert] = "Donation saved"
    redirect_to family_path(@family)
  end

end
