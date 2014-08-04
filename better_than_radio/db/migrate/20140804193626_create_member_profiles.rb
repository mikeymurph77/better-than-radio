class CreateMemberProfiles < ActiveRecord::Migration
  def change
    create_table :member_profiles do |t|
      t.string :firstname, null: false
      t.string :location, null: false

      t.timestamps null: false
    end
  end
end
