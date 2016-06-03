class AddAttachmentGroupAvatarToGroups < ActiveRecord::Migration
  def self.up
    change_table :groups do |t|
      t.attachment :group_avatar
    end
  end

  def self.down
    remove_attachment :groups, :group_avatar
  end
end
