class BookingsController < ApplicationController
    
    def show
        @booking = Booking.find(params[:id])
    end
    
    def new
        @booking = Booking.new
    end

    def create
        @booking = Booking.new(booking_params)
        @booking.user = current_user
        @booking.save
        redirect_to booking_path(@booking) 
    end

    def my_bookings
        
    end

    private

    def booking_params
      params.require(:booking).permit(:status)
    end
  

end
