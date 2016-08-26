class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|

      t.references :comment, null: false

      t.integer :value, null: false

      t.references :voter, null: false

      t.timestamps null: false
    end
  end
end
