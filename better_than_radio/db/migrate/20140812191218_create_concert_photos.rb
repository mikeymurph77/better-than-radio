class CreateConcertPhotos < ActiveRecord::Migration
  def change
    create_table :concert_photos do |t|
      t.belongs_to :concert, index: true, null: false
      t.belongs_to :fan, index: true, null: false
      t.string :description, null: false
      t.timestamps null: false
    end
  end
end
