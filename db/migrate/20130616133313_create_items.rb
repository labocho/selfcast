class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.references :channel, null: false
      t.string :title, null: false
      t.text :description
      t.string :content, null: false
      t.datetime :published_at, null: false

      t.timestamps
    end
    add_index :items, :channel_id
  end
end
