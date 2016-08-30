class DropUser < ActiveRecord::Migration[5.0]
  def change
    execute "DROP TABLE USERS CASCADE"
  end
end
