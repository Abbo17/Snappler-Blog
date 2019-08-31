class Admin::ProductsController < AdminController
    add_breadcrumb "Productos ", :admin_products_path
    before_action :authenticate_user!

    def index
        @products = Product.all
    end

    def new 
        @product = Product.new
    end

    def create
        @product = Product.new(
		params.require(:product)
		.permit(:name,:description,:cod,:price,:cost,:active,:category_id,:image,tag_ids: [],)
		)
        @cantidadName = Product.where(name: @product.name).count
        @cantidadCod = Product.where(cod: @product.cod).count
        
        if (@cantidadName != "0" && @cantidadCod != "0" )
            if @product.save
				redirect_to admin_products_path
			else
				redirect_to admin_products_path
            end
        else
            redirect_to admin_products_path
        end
    end
end
