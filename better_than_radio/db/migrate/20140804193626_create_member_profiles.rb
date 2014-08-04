class CreateMemberProfiles < ActiveRecord::Migration
  def change
    create_table :fans do |t|
      t.string :name, null: false
      t.string :location, null: false

      t.timestamps null: false
    end
  end
end
