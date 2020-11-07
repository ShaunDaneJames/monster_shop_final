class DiscountsController < Merchant::BaseController

  def new
    @discount = Discount.new
    # @discount = Merchant.find(params[:merchant_id])
  end

  def create
    merchant = Merchant.find(params[:merchant_id])
    discount = merchant.discounts.create({
      percentage: params([:percentage]),
      quantity: params([:quantity])
      })
  end
end
