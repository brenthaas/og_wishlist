class AddUserAssociationToWish < ActiveRecord::Migration
  def change
    change_table :wishes do |t|
      t.belongs_to :user
    end
  end
end
