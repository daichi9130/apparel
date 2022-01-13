class Admins::ShopsController < ApplicationController
  before_action :authenticate_admin!

  def new
    @shop = Mapshop.new
  end

  def create
    @shop = Mapshop.new(shop_params)
    @shop.save
    redirect_to admins_shop_path(@shop.id)
  end

  def show
    @shop = Mapshop.find(params[:id])
  end

  private

  def shop_params
    params.require(:mapshop).permit(:name, :postal, :address, :tell, :begin_at, :closed_at, :latitude, :longitude)
  end



end
