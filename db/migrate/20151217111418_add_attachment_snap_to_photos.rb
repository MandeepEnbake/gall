class AddAttachmentSnapToPhotos < ActiveRecord::Migration
  def self.up
    change_table :photos do |t|
      t.attachment :snap
    end
  end

  def self.down
    remove_attachment :photos, :snap
  end
end
