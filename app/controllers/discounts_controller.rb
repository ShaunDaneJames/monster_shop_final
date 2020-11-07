class DiscountsController < Merchant::BaseController

  def new
    @merchant = Merchant.find(params[:merchant_id])
  end

  def create
    merchant = Merchant.find(params[:merchant_id])
    merchant.discounts.create(discount_params)
  end

  private
  def discount_params
    params.permit(:percentage, :quantity)
  end
end
