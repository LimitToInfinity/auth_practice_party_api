class BeveragesController < ApplicationController

  def index
    @beverages = Beverage.where(user_id: @user.id)
    render json: @beverages
  end

  def create
    @beverage = Beverage.create(beverage_params)
    render json: @beverage
  end

  private

  def beverage_params
    params
      .require(:beverage)
      .permit(:name, :size)
      .merge(user_id: @user.id)
  end

end
