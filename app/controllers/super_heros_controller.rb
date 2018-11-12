class SuperHerosController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @super_heros = SuperHero.all
  end

  def show
    @super_hero = SuperHero.find(params[:id])
  end
end
