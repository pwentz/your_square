class RecreateUser < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.text :token
    end
  end
end
