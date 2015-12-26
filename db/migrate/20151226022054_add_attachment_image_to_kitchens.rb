class AddAttachmentImageToKitchens < ActiveRecord::Migration
  def self.up
    change_table :kitchens do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :kitchens, :image
  end
end
