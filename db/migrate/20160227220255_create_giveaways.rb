class CreateGiveaways < ActiveRecord::Migration
  def change
    create_table :giveaways do |t|

      t.timestamps null: false
    end
  end
end
