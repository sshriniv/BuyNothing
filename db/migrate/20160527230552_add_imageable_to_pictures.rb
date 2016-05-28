class AddImageableToPictures < ActiveRecord::Migration
  def change
    remove_column :pictures, :post_id
    add_column :pictures, :imageable_id, :integer
    add_column :pictures, :imageable_type, :string
  end
end
