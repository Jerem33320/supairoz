class CreateSuperHeroPowers < ActiveRecord::Migration[5.2]
  def change
    create_table :super_hero_powers do |t|
      t.references :super_hero, foreign_key: true
      t.references :power, foreign_key: true

      t.timestamps
    end
  end
end
