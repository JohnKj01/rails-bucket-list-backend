class CategoriesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity

  def index
    categories = Category.all
    render json: categories
  end

  def show
    category = find_category_by_id
    items = category.items.to_json(include: :category)
    render json: category
  end

  def create
    category = Category.new(category_params)
    category.save!
    render json: category
  end

  def update
    category = find_category_by_id
    category.update!(category_params)
    render json: category
  end

  def destroy
    category = find_category_by_id
    category.destroy
    render json: category
  end

  private

  def find_category_by_id
    Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end

  def render_not_found
    render json: { errors: 'Category not found' }, status: :not_found
  end

  def render_unprocessable_entity(exception)
    render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
  end
end
