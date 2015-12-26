class AddAttachmentResourceToKitchens < ActiveRecord::Migration
  def self.up
    change_table :kitchens do |t|
      t.attachment :resource
    end
  end

  def self.down
    remove_attachment :kitchens, :resource
  end
end
