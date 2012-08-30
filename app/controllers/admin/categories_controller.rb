module Admin
  class CategoriesController < AdminController
    def index
      @category = Category.new
      
      @categories = Category.all
    end
    
    def create     
      
      #@category = Category.new
      @categories = Category.all
      
      @category = Category.new(params[:category])
      
      if @category.save
        flash[:notice] = 'Categoria salva com sucesso'
        redirect_to :action => 'index'
        return
      else
        flash[:error] = 'Falha ao salvar'  
      end

      render :action => 'index'

    end
    
  end
end