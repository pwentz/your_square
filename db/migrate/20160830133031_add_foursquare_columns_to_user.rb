class AddFoursquareColumnsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :uid, :text
    add_column :users, :name, :text
    add_column :users, :location, :text
    add_column :users, :photo, :text
  end
end
