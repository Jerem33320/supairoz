class CreateSuperHeros < ActiveRecord::Migration[5.2]
  def change
    create_table :super_heros do |t|
      t.string :name
      t.text :picture
      t.text :address
      t.integer :price
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
