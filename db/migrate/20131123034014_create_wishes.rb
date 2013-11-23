class CreateWishes < ActiveRecord::Migration
  def change
    create_table :wishes do |t|
      t.string :title
      t.text :summary
      t.text :url
      t.text :image

      t.timestamps
    end
  end
end
