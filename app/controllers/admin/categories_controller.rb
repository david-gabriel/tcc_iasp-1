module Admin
  class CategoriesController < AdminController
    def index
      @category = Category.new
      
      @categories = Category.all
    end
    
    def show
      @category = Category.find(params[:id])
    end
    
    def create     
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
    
    def edit
      @category = Category.find(params[:id])
    end
    
    def update
      puts params.inspect
      @category = Category.find(params[:id])
      if @category.update_attributes(params[:category])
        redirect_to :action => 'index'
        return
      else
        flash[:error] = 'Falha ao salvar'
        render :edit 
      end
    end
    
  end
end