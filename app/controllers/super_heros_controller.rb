class SuperHerosController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_super_hero, only: [:show, :edit, :update, :destroy]
  def index
    @super_heros = SuperHero.all
  end

  def show
  end

  def new
    @super_hero = SuperHero.new
  end

  def create
    @super_hero = SuperHero.new(super_hero_params)
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
    params.require(:super_hero).permit(:name, :address, :picture, :price)
  end

  def set_super_hero
    @super_hero = SuperHero.find(params[:id])
  end
end
