class ItemsController < ApplicationController
    def index
        @items = Item.all
        render json: @items, include: { category: { only: [:id, :name] } }
      end
    
      def create
        @item = Item.new(name: params[:name], completed: false, category_id: params[:category_id])
        if @item.save
          render json: @item, include: { category: { only: [:id, :name] } }
        else
          render json: { errors: @item.errors }, status: :unprocessable_entity
        end
    end
end
