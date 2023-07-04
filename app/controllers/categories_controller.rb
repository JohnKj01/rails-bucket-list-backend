class CategoriesController < ApplicationController
    def index
      categories = Category.all.to_json(include: :items)
      render json: categories
    end
  
    def show
      category = Category.find_by(name: params[:name])
      if category
        items = category.items.to_json(include: :category)
        render json: items
      else
        render json: { errors: "Category not found" }, status: :not_found
      end
    end
  
    private
  
    def category_params
      params.require(:category).permit(:name)
    end
  end