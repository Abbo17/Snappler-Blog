class Fronted::CatalogoController < FrontedController
    def index
        case params[:opcion]
            when "0"
                @products = Product.where(active: true)
            when "1"
                if params[:search].present?
                    @products = Product.where(active:true).search(params[:search])
                    @search = params[:search]
                else
                    @products = Product.where(active:true, category_id: params[:category_id])
                    @category = params[:category_id]
                end
            when "2"
                if (params[:search].present?)
                    @products = Product.where(active:true).search(params[:search])
                    @search = params[:search]
                else
                    if (params[:category].present?)
                        @products = Product.where(active:true, category: params[:category])
                        @category = params[:category]
                    else
                        @products = Product.where(active: true)
                    end
                end
                case params[:orden]
                    when  "1"
                        @orden = 'name ASC' 
                    when  "2"
                        @orden = 'name DESC' 
                    when "3"
                        @orden = 'price ASC' 
                    when "4"
                        @orden = 'price DESC' 
                        
            end
        end
        
    end

end
    