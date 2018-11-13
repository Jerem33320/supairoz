class My::BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @super_hero = SuperHero.find(params[:id])
    @booking.super_hero = @super_hero
    if @booking.save
      redirect_to root_path(@booking)
    else
      render :new
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking.update(booking_params)
    redirect_to my_booking_path(@booking)
  end

  def destroy
    @booking.canceled_at = Date.today
    redirect_to root_path
  end

  private

  def booking_params
    params.require(:booking).permit(:starts_at, :ends_at)
    ends
  end
end
