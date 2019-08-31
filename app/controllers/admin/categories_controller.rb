class Admin::CategoriesController < AdminController
    add_breadcrumb "Categorias", :admin_categories_path
    before_action :authenticate_user!
    def index
        @categories = Category.all
    end

    def destroy
        @category=Category.find(params[:id])
        @category.destroy
        redirect_to admin_categories_path
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
end
