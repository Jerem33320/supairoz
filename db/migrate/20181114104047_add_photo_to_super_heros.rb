class AddPhotoToSuperHeros < ActiveRecord::Migration[5.2]
  def change
    add_column :super_heros, :photo, :string
  end
end
