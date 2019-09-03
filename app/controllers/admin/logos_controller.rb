class Admin::LogosController < AdminController
    def create
        @logo = Logo.first
            if (@logo.present?)
                @logo.update(image: params[:logo][:image])
                redirect_to admin_sliders_path
            else
                @logo = Logo.new(params.require(:logo).permit(:image))
                if @logo.save
                    redirect_to admin_sliders_path
                else
                    render :new_admin_sliders_path
                end
            end
    end
end
