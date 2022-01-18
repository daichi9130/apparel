class StoresController < ApplicationController

  def index
    @shop = Mapshop.all
  end

  def show
    @shop = Mapshop.find(params[:id])
  end

end
