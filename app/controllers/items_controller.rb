class ItemsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :item_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :record_invalid

  def index
    @items = Item.all
    render json: @items, include: { category: { only: [:id, :name] } }
  end

  def create
    @item = Item.new(item_params)
    @item.completed = false
    @item.save!
    render json: @item
  end

  def show
    @item = find_item_by_id
    render json: @item
  end

  def destroy
    @item = find_item_by_id
    @item.destroy!
    head :no_content
  end

  def update
    @item = find_item_by_id
    @item.update!(item_params)
    render json: @item
  end

  def home
    render json: { message: "Good luck with your project!" }
  end

  private

  def item_params
    params.require(:item).permit(:name, :completed, :category_id, :user_id, :completed_by)
  end

  def find_item_by_id
    Item.find_by(id: params[:id]) || item_not_found
  end

  def item_not_found
    render json: { errors: "Item not found" }, status: :not_found
  end

  def record_invalid(exception)
    render json: { errors: exception.record.errors }, status: :unprocessable_entity
  end
end
