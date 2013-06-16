class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.references :channel
      t.string :title
      t.text :description
      t.string :content
      t.datetime :published_at

      t.timestamps
    end
    add_index :items, :channel_id
  end
end
