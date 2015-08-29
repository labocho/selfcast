class AllowContentToNullOnItems < ActiveRecord::Migration
  def up
    change_column :items, :content, :string, null: true
  end

  def down
    change_column :items, :content, :string, null: false
  end
end
