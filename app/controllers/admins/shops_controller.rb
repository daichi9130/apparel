class Admins::ShopsController < ApplicationController
  before_action :authenticate_admin!

  def new
    @shop = Mapshop.new
  end

  def index
    @shop = Mapshop.all
  end

  def create
    @shop = Mapshop.new(shop_params)
    if @shop.save
      redirect_to admins_shop_path(@shop.id)
    else
      render :new
    end
  end

  def destroy
    @shop = Mapshop.find(params[:id])
    @shop.destroy
    redirect_to admins_shops_path

  end

  def show
    @shop = Mapshop.find(params[:id])
  end

  def edit
    @shop = Mapshop.find(params[:id])
  end

  def update
    @shop = Mapshop.find(params[:id])
    @shop.update(shop_params)
    redirect_to admins_shop_path(@shop.id)
  end

  private

  def shop_params
    params.require(:mapshop).permit(:name, :postal, :address, :tell, :begin_at, :closed_at)
  end

end
