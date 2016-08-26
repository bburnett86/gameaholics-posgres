class CreateOwnerships < ActiveRecord::Migration
  def change
    create_table :ownerships do |t|

      t.references :owner, null: false

      t.references :game, null: false

      t.timestamps null: false
    end
  end
end
