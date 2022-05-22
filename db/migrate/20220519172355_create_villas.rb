class CreateVillas < ActiveRecord::Migration[6.1]
  def change
    create_table :villas do |t|
      t.string :name
      t.string :address
      t.text :description
      t.integer :price_per_night
      t.integer :number_of_guests
      t.string :picture_url

      t.timestamps
    end
  end
end
