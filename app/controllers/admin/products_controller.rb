class Admin::ProductsController < AdminController
    add_breadcrumb "Productos ", :admin_products_path
    before_action :authenticate_user!

    def index
        @products = Product.all
    end

    def new 
        add_breadcrumb "Nuevo ", :new_admin_product_path
        @product = Product.new
    end

    def destroy
        @product=Product.find(params[:id])
        @product.destroy
        redirect_to admin_products_path

    end

    def create
        
        @product = Product.new(
		params.require(:product)
		.permit(:name,:description,:cod,:price,:cost,:active,:category_id,images: [],tag_ids: [],)
		)
        @cantidadName = Product.where(name: @product.name).count
        @cantidadCod = Product.where(cod: @product.cod).count
        
        if (@cantidadName == 0 && @cantidadCod == 0 )
            if @product.save
				redirect_to showImages_admin_product_path(:id => @product.id)
			else
				redirect_to admin_products_path
            end
        else
            redirect_to admin_products_path
        end
    end
    
    def show
        add_breadcrumb "Ver Producto ", :admin_product_path
        @product=Product.find(params[:id])
    end

    def update
        @product = Product.find(params[:id])

        @cantProductName = Product.where(name: params[:product][:name]).count
        @cantProductCod = Product.where(cod: params[:product][:cod]).count

        if (@cantProductName <= 1 && @cantProductCod <= 1)
            @product.update(name: params[:product][:name], 
                        description: params[:product][:description], 
                        cod: params[:product][:cod],
                        price: params[:product][:price],
                        cost: params[:product][:cost],
                        active: params[:product][:active],
                        category_id: params[:product][:category_id],
                        tag_ids: params[:product][:tag_ids]
                        )
            
            
            if (params[:product][:images])
                @product.images = params[:product][:images]
                
                @product.save
            end
            
            redirect_to showImages_admin_product_path(:id => @product.id)
        else
            redirect_to admin_products_path
        end

    end

    def showImages
       @product = Product.find(params[:id])
    end

    def selectImages
        @product = Product.find(params[:product_id])
        @product.imageActive = params[:image_id]

        if @product.save
            redirect_to admin_products_path
        else
            redirect_to admin_products_path
        end
    
    end
end
