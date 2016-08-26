class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|

      t.references :game, null: false

      t.integer :value, null: false

      t.references :rater, null: false

      t.timestamps null: false
    end
  end
end
