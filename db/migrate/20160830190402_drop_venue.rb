class DropVenue < ActiveRecord::Migration[5.0]
  def change
    execute "DROP TABLE VENUES CASCADE"
  end
end
