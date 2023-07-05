class ItemsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :item_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :record_invalid

  def index
    @items = Item.all
    render json: @items, include: { category: { only: [:id, :name] } }
  end

  def create
    @item = Item.new(
      name: params[:name],
      completed: false,
      category_id: params[:category_id],
      user_id: params[:user_id] # Add this line
    )
    @item.save!
    render json: @item, include: { category: { only: [:id, :name] } }
  end
  
  
  def show
    @item = Item.find(params[:id])
    render json: @item, include: { category: { only: [:id, :name] } }
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Item not found' }, status: :not_found
  end
  
  def destroy
    @item = Item.find(params[:id])
    @item.destroy!
    head :no_content
  end

  def patch
    @item = Item.find(params[:id])
    @item.update!(completed: params[:completed])
    render json: @item, include: { category: { only: [:id, :name] } }
  end

  def home
    render json: { message: "Good luck with your project!" }
  end

  private

  def item_not_found
    render json: { errors: "Item not found" }, status: :not_found
  end

  def record_invalid(exception)
    render json: { errors: exception.record.errors }, status: :unprocessable_entity
  end
end
