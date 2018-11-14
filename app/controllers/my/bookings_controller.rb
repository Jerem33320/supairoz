class My::BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def index
    @bookings = Booking.all
  end

  def show
  end

  def create
    @booking = Booking.new(booking_params)
    @super_hero = SuperHero.find(params[:super_hero_id])
    @booking.super_hero = @super_hero
    @booking.user = current_user
    if @booking.save
      redirect_to my_bookings_path(@booking)
    else
      render "super_heros/show"
    end
  end

  def edit
  end

  def update
    @booking.update(booking_params)
    redirect_to my_booking_path(@booking)
  end

  def destroy
    @booking.destroy
    redirect_to my_bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:starts_at, :ends_at, :review)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
