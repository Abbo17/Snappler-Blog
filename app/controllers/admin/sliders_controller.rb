class Admin::SlidersController < AdminController
    before_action :authenticate_user!
    add_breadcrumb "Configuración Web ", :admin_products_path


    def index
        @sliders = Slider.all
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
            redirect_to new_admin_sliders_path
        end
    end

    def destroy
        @slider=Slider.find(params[:id])
        @slider.destroy
        redirect_to admin_sliders_path
    end

    private
    def slider_params
      params.require(:slider).permit(:name, :image)
    end
end