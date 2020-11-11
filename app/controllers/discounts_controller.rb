class DiscountsController < Merchant::BaseController

  def new
    @merchant = Merchant.find(params[:merchant_id])
  end

  def create
    merchant = Merchant.find(params[:merchant_id])
    discount = merchant.discounts.create(discount_params)
    if discount.save
      redirect_to "/merchant"
    else
      flash[:error] = "Please select a percent between 0 - 100 and a quantity greater than 1!"
      redirect_to "/merchant/#{merchant.id}/discount/new"
    end
  end

  def edit
    @merchant = Merchant.find(params[:merchant_id])
    @discount = Discount.find(params[:discount_id])
  end

  def update
    discount = Discount.find(params[:discount_id])
    discount.update(discount_params)
    redirect_to '/merchant'
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
