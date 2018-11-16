class SuperHerosController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_super_hero, only: [:show, :edit, :update, :destroy]

  def index
    @powers = Power.all
    if params[:query].present?
      @super_heros = SuperHero.where.not(latitude: nil, longitude: nil).search_by_name(params[:query])
    else
      @super_heros = SuperHero.where.not(latitude: nil, longitude: nil)
    end

    @markers = @super_heros.map do |super_hero|
      {
        lng: super_hero.longitude,
        lat: super_hero.latitude,
        infoWindow: { content: render_to_string(partial: "/super_heros/map_window", locals: { super_hero: super_hero }) }

      }
    end
  end

  def show
    @booking = Booking.new
    if params[:query].present?
      @super_heros = SuperHero.where.not(latitude: nil, longitude: nil).search_by_name(params[:query])
    else
      @super_heros = SuperHero.where.not(latitude: nil, longitude: nil)
    end

    @markers = @super_heros.map do |super_hero|
      {
        lng: super_hero.longitude,
        lat: super_hero.latitude,
        infoWindow: { content: render_to_string(partial: "/super_heros/map_window", locals: { super_hero: super_hero }) }

      }
    end
  end

  def new
    @super_hero = SuperHero.new
  end

  def create
    @super_hero = SuperHero.new(super_hero_params)
    @super_hero.user = current_user
    if @super_hero.save
      redirect_to super_hero_path(@super_hero)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @super_hero.update(super_hero_params)
    redirect_to super_hero_path(@super_hero)
  end

  def destroy
    @super_hero.destroy
    redirect_to root_path
  end

  private

  def super_hero_params
    params.require(:super_hero).permit(:name, :address, :photo, :photo_cache, :price, power_ids: [])
  end

  def set_super_hero
    @super_hero = SuperHero.find(params[:id])
  end
end
