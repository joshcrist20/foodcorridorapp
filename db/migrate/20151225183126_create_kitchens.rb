class CreateKitchens < ActiveRecord::Migration
  def change
    create_table :kitchens do |t|
      t.string :host
      t.string :location
      t.text :description
      t.integer :price
      t.boolean :availability, default: true

      t.timestamps null: false
    end
  end
end
