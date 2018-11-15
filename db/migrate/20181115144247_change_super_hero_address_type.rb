class ChangeSuperHeroAddressType < ActiveRecord::Migration[5.2]
  def change
    change_column :super_heros, :address, :string
  end
end
