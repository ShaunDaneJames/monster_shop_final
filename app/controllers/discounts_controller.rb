class DiscountsController < Merchant::BaseController

  def new
    @merchant = Merchant.find(params[:merchant_id])
  end

  def create
    merchant = Merchant.find(params[:merchant_id])
    merchant.discounts.create(discount_params)
    redirect_to "/merchant"
  end

  def update
  end
  
  def destroy
    Discount.destroy(params[:discount_id])
    redirect_to "/merchant"
  end

  private
  def discount_params
    params.permit(:percentage, :quantity)
  end
end
