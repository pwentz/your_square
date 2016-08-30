class CreateCheckin < ActiveRecord::Migration[5.0]
  def change
    create_table :checkins do |t|
      t.references :user, foreign_key: true
      t.references :venue, foreign_key: true
    end
  end
end
