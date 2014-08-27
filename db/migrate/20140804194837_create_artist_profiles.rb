class CreateArtistProfiles < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name, null: false
      t.string :genre, null: false
      t.string :contact_name, null: false
      t.string :contact_phone, null: false
      t.string :bio, null: false, default: ""
      t.string :soundcloud, null: false, default: ""
      t.string :twitter, null: false, default: ""
      t.string :facebook, null: false, default: ""
      t.string :youtube, null: false, default: ""
      t.string :myspace, null: false, default: ""
      t.string :beatport, null: false, default: ""
      t.string :tumblr, null: false, default: ""
      t.string :website, null: false, default: ""

      t.timestamps null: false
    end
  end
end
