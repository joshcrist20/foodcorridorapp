class AddSlugToKitchens < ActiveRecord::Migration
  def change
    add_column :kitchens, :slug, :string
    add_index :kitchens, :slug, unique: true
  end
end
