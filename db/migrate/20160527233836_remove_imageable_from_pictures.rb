class RemoveImageableFromPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :post_id, :integer
    remove_column :pictures, :imageable_id, :integer
    remove_column :pictures, :imageable_type, :string
  end
end
