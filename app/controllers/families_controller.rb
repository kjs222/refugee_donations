class FamiliesController < ApplicationController


  def index
    @families = Family.to_arrive
  end

  def show
    @family = Family.find(params[:id])
  end











end
