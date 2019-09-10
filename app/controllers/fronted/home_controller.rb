class Fronted::HomeController < FrontedController
    def index
      @sliders = Slider.all
      @products = Product.all
    end

  end
    