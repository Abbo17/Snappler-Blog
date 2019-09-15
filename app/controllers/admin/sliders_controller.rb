class Admin::SlidersController < AdminController
    before_action :authenticate_user!
    add_breadcrumb "Configuración Web ", :admin_products_path


    def index
        @logoActual = Logo.first
        @logo = Logo.new
        @sliders = Slider.page(params[:page])
    end

    def new 
        add_breadcrumb "Nuevo Slider", :new_admin_slider_path
        @slider = Slider.new()
    end
    def create
        @slider = Slider.new(
            params.require(:slider)
            .permit(:name,:image))
        @cantidad = Slider.where(name: @slider.name).count
        if @cantidad == 0 
            #@slider.image.attach(params[:image])
            if @slider.save
                  redirect_to admin_sliders_path
            else
                  render :new_admin_sliders_path
            end
        else
            @error = "El nombre del slider esta en uso"
            render :new
        end
    end

    def destroy
        @slider=Slider.find(params[:id])
        @slider.destroy
        redirect_to admin_sliders_path
    end

    def show
        add_breadcrumb "Ver Slider ", :admin_slider_path
        @slider=Slider.find(params[:id])
    end

    def update
    
        @slider = Slider.find(params[:id])
        @cantSlidername = 0

        if (@slider.name != params[:slider][:name])
            @cantSlidername = Slider.where(name: params[:slider][:name]).count
        end

        if (@cantSlidername == 0 )
            @slider.update( name: params[:slider][:name],
                            image: params[:slider][:image]
                            )
            
            redirect_to admin_sliders_path
        else
            @error = "El nombre del Slider esta en uso"
            render :show
        end

    end
    
    private
    def slider_params
      params.require(:slider).permit(:name, :image)
    end
end