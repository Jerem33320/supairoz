class SuperHerosController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @super_heros = SuperHero.all
  end
end
