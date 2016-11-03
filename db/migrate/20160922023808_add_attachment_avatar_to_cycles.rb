class AddAttachmentAvatarToCycles < ActiveRecord::Migration
  def self.up
    change_table :cycles do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :cycles, :avatar
  end
end
