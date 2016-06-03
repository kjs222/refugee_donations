class FamiliesController < ApplicationController


  def index
    @families = Family.all
  end

  def new
    @family = Family.new
  end

  def create
    @family = Family.new(family_params)
    if @family.save
      redirect_to family_path(@family)
    else
      render :new
    end
  end

  def show
    @family = Family.find(params[:id])
  end

  def edit
    @family = Family.find(params[:id])
  end

  def update
    @family = Family.find(params[:id])
    if @family.update(family_params)
      redirect_to family_path(@family)
    else
      render :edit
    end
  end

  def destroy
    @family = Family.find(params[:id])
    @family.destroy
    redirect_to families_path
  end





  private

  def family_params
    params.require(:family).permit(:first_name, :last_name, :address, :arrival_date, :nationality, :description, :num_married_adults, :num_non_married_adults, :num_children_over_two, :num_children_under_two)
  end



end
