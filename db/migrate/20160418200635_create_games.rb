class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|

      t.string :name, null: false

      t.text :description, null: false

      t.string :rules_url, null: false

      t.string :image_url, null: false

      t.timestamps null: false
    end
  end
end
