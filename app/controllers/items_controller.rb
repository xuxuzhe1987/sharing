class ItemsController < ApplicationController
    skip_before_action :authenticate_user!, only: [ :index ]

    def index
        @items = policy_scope(Item).order(created_at: :desc)
    end

    def show
        @item = Item.find(params[:id])
        authorize @item
    end

    def new
        @item = Item.new 
        # needed to instantiate the form_for
        authorize @item
    end

    def create
        @item = Item.new(item_params)
        authorize @item
        @item.user = current_user
        @item.save
        # no need for app/views/items/create.html.erb
        redirect_to item_path(@item)
    end

    def edit
        @item = Item.find(params[:id])
        authorize @item
    end

    def update
        @item = Item.find(params[:id])
        authorize @item
        @item.update(item_params)
        # no need for app/views/items/update.html.erb
        redirect_to item_path(@item)
    end

    def destroy
        @item = Item.find(params[:id])
        authorize @item
        @item.destroy
        # no need for app/views/items/destroy.html.erb
        redirect_to items_path
    end

    def my_items
        @my_items = Item.where(user: current_user)
        authorize @my_items
    end

    private

    def item_params
        params.require(:item).permit(:title, :description)
    end
end
