class AllowContentToNullOnItems < ActiveRecord::Migration
  def up
    execute "UPDATE items SET content = '' WHERE content IS NULL"
    change_column :items, :content, :string, null: false
  end

  def down
    change_column :items, :content, :string, null: true
  end
end
