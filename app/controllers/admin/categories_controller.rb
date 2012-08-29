module Admin
  class CategoriesController < AdminController
    def index
      @category = Category.new
      
      @categories = Category.all
    end
    
    def new
      @category = Category.new
    end
  end
end