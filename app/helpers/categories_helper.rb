module CategoriesHelper
    def probando(id)
        @category=Category.find(id) 
    end
end
