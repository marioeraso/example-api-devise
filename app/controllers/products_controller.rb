class ProductsController < ApiController

  def index
    render json: { status: :ok }
  end

  def all_products
    render json: Product.all
  end
end
