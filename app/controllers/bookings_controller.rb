class BookingsController < ApplicationController
    
    def show
        @booking = Booking.find(params[:id])
        authorize @booking
    end
    
    def new
        @item = Item.find(params[:item_id])
        @booking = Booking.new 
        # needed to instantiate the form_for
        authorize @booking
    end

    def create
        @booking = Booking.new(booking_params)
        authorize @booking
        @item = Item.find(params[:item_id])
        @booking.item_id = @item.id
        @booking.user_id = current_user.id
        @booking.save
        redirect_to item_path(@item) 
    end

    def edit
        @booking = Booking.find(params[:id])
        authorize @booking
    end

    def update
        @booking = Booking.find(params[:id])
        authorize @booking
        @booking.update(booking_params)
        # no need for app/views/bookings/update.html.erb
        redirect_to booking_path(@booking)
    end

    def my_bookings
        @my_bookings = Booking.where(user: current_user)
        authorize @my_bookings
    end

    private

    def booking_params
      params.require(:booking).permit(:status)
    end
  

end
