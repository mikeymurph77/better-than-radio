class CreateOpeningActs < ActiveRecord::Migration
  def change
    create_table :opening_acts do |t|
      t.belongs_to :artist
      t.belongs_to :concert

      t.timestamps null: false
    end
  end
end
