class Admin::TagsController < AdminController
    add_breadcrumb "Etiquetas", :admin_tags_path
    before_action :authenticate_user!
    def index
        @tags = Tag.all
    end

    def destroy
        @tag=Tag.find(params[:id])
        @tag.destroy
        redirect_to admin_tags_path
    end

    def create
        @tag = Tag.new(
            params.require(:tag)
            .permit(:name))
        @cantidad = Tag.where(name: @tag.name).count
        if @cantidad == 0 
            if @tag.save
                  redirect_to admin_tags_path
            else
                  render :admin_tags_path
            end
        else
            redirect_to admin_tags_path
        end

    end
end
