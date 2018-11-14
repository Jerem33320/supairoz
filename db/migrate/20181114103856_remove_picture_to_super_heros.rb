class RemovePictureToSuperHeros < ActiveRecord::Migration[5.2]
  def change
    remove_column :super_heros, :picture, :text
  end
end
