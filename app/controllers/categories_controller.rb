class CategoriesController < ApplicationController
  def index
    categories = Category.all.to_json(include: :items)
    render json: categories
  end

  def show
    category = Category.find_by(id: params[:id])
    if category
      items = category.items.to_json(include: :category)
      render json: items
    else
      render json: { errors: "Category not found" }, status: :not_found
    end
  end

  def create
    category = Category.new(category_params)
    if category.save
      render json: category.to_json(include: :items)
    else
      render json: { errors: category.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    category = Category.find_by(id: params[:id])
    if category
      category.destroy
      render json: category.to_json(include: :items)
    else
      render json: { errors: "Category not found" }, status: :not_found
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
