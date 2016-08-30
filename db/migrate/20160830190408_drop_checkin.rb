class DropCheckin < ActiveRecord::Migration[5.0]
  def change
    execute "DROP TABLE CHECKINS CASCADE"
  end
end
