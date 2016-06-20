class CreateWins < ActiveRecord::Migration
  def change
    create_table :wins do |t|
      t.integer :user_id
      t.integer :post_id
      t.text :message

      t.timestamps null: false
    end
  end
end
