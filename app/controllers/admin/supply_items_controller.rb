class Admin::SupplyItemsController <Admin::BaseController

  def edit
    @family = Family.find(params[:family_id])
    @supply_items = @family.supply_items.all
  end

  def update
    @family = Family.find(params[:family_id])
    @family.supply_items.each do |supply_item|
      #dont know how to get the details of the indiviaudl supply item for params
      supply_item.update(supply_item_params)
      #dont know how do do the if else on unsucessful save
    end

    redirect_to family_path(@family)

  end


  def supply_item_params
    params.require(:supply_item).permit(:quantity)
    #do I need the others
  end





end
