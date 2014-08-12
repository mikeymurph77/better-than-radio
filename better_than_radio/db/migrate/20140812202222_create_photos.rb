class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.belongs_to :fan, index: true, null: false
      t.belongs_to :concert, index: true, null: false
      t.string :description, null: false
      t.timestamps null: false
    end
  end
end
