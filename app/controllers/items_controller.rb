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
    def destroy
        @item = Item.find_by_id(params[:id])
        if @item
          @item.destroy
          render json: @item, include: { category: { only: [:id, :name] } }
        else
          render json: { errors: "Item not found" }, status: :not_found
        end
      end
    
      def patch
        @item = Item.find_by_id(params[:id])
        if @item
          @item.update(completed: params[:completed])
          render json: @item, include: { category: { only: [:id, :name] } }
        else
          render json: { errors: "Item not found" }, status: :not_found
        end
      end
    
      def home
        render json: { message: "Good luck with your project!" }
      end
end
