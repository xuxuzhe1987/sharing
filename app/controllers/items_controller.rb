class ItemsController < ApplicationController
    skip_before_action :authenticate_user!, only: [ :index ]

    def index
        @items = Item.all
    end

    def show
        @item = Item.find(params[:id])
    end

    def new
        @item = Item.new 
        # needed to instantiate the form_for
    end

    def create
        @item = Item.new(item_params)
        @item.user = current_user
        @item.save
        # no need for app/views/items/create.html.erb
        redirect_to item_path(@item)
    end

    def edit
        @item = Item.find(params[:id])
    end

    def update
        @item = Item.find(params[:id])
        @item.update(item_params)
        # no need for app/views/items/update.html.erb
        redirect_to item_path(@item)
    end

    def destroy
        @item = Item.find(params[:id])
        @item.destroy
        # no need for app/views/items/destroy.html.erb
        redirect_to items_path
    end

    private

    def item_params
        params.require(:item).permit(:title, :description)
    end
end
