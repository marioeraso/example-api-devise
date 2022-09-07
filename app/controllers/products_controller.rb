class ProductsController < ApiController
  load_and_authorize_resource

  def index
    render json: { status: :ok }
  end

  def create
    product = Product.create!(product_params)

    render json: product
  end

  def show
    render json: { saludo: "hola" }
  end

  def all_products
    render json: Product.all
  end

  def product_params
    params.require(:product).permit(:name, :description, :portions, :calories)
  end
end
