class AddDefaultNameToUsers < ActiveRecord::Migration
  def change
    change_column :users, :name, :string, :default => ""
  end
end
