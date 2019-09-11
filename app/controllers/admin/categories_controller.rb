class Admin::CategoriesController < AdminController
    add_breadcrumb "Categorias", :admin_categories_path
    before_action :authenticate_user!
    def index
        @categories = Category.page(params[:page])
    end

    def destroy
        @category=Category.find(params[:id])
        @cant = @category.products.count
        if (@cant == 0)
            @category.destroy
            redirect_to admin_categories_path
        else
            redirect_to admin_categories_path
        end
    end

    def new 
        add_breadcrumb "Nueva categoria", :new_admin_category_path
        @category = Category.new();
    end 
    def create
        @category = Category.new(
            params.require(:category)
            .permit(:name))
        @cantidad = Category.where(name: @category.name).count
        if @cantidad == 0 
            if @category.save
                  redirect_to admin_categories_path
            else
                  render :admin_categories_path
            end
        else
            redirect_to admin_categories_path
        end

    end

    def show
        add_breadcrumb "Ver Categoria ", :admin_category_path
        @category=Category.find(params[:id])
    end

    def update
    
        @category = Category.find(params[:id])
        
        @cantCategoryName = Category.where(name: params[:category][:name]).count

        if (@cantCategoryName == 0 )
            @category.update(name: params[:category][:name])
            
            redirect_to admin_categories_path
        else
            redirect_to admin_categories_path
        end

    end
end
