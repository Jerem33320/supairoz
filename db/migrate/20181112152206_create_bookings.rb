class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.datetime :starts_at
      t.datetime :ends_at
      t.text :review
      t.integer :rating
      t.references :user, foreign_key: true
      t.references :super_hero, foreign_key: true
      t.datetime :canceled_at

      t.timestamps
    end
  end
end
