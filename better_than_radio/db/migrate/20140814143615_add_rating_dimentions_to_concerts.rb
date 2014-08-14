class AddRatingDimentionsToConcerts < ActiveRecord::Migration
  def change
    add_column :concerts, :overall, :string
    add_column :concerts, :selection, :string
    add_column :concerts, :crowd, :string
  end
end
