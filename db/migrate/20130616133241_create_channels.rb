class CreateChannels < ActiveRecord::Migration
  def change
    create_table :channels do |t|
      t.string :title
      t.text :description
      t.string :image

      t.timestamps
    end
  end
end
