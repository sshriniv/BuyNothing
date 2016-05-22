class AddUserIdToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :user_id, :string
    add_column :posts, :group_id, :string
  end
end
