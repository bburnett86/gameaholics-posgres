class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :taggings do |t|

      t.references :tag, null: false

      t.references :game, null: false

      t.timestamps null: false
    end
  end
end
