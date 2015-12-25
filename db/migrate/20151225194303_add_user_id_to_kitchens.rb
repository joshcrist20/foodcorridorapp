class AddUserIdToKitchens < ActiveRecord::Migration
  def change
    add_column :kitchens, :user_id, :integer
  end
end
