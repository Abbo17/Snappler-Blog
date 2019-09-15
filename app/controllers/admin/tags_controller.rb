class Admin::TagsController < AdminController
    add_breadcrumb "Etiquetas", :admin_tags_path
    before_action :authenticate_user!
    def index
        @tags = Tag.page(params[:page])
    end

    def destroy       
        @tag=Tag.find(params[:id])
        @cant = @tag.products.count
        if (@cant == 0)
            @tag.destroy
            redirect_to admin_tags_path
        else
            @error = "La etiqueta contiene productos y no puede ser eliminada"
            @tags = Tag.page(params[:page])
            render :index
        end
    end

    def new
        @tag = Tag.new
    end

    def create
        add_breadcrumb "Nueva Etiqueta", :new_admin_tag_path
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
            @error = "La etiqueta ya existe"
            render :new
        end

    end

    def show
        add_breadcrumb "Ver Etiqueta ", :admin_tag_path
        @tag=Tag.find(params[:id])
    end

    def update
    
        @tag = Tag.find(params[:id])
        
        @cantTagName = Tag.where(name: params[:tag][:name]).count

        if (@cantTagName == 0 )
            @tag.update(name: params[:tag][:name])
            
            redirect_to admin_tags_path
        else
            @error = "La etiqueta ya existe"
            render :new
        end

    end
end

