class AddPictureToPeople < ActiveRecord::Migration
  def change
    add_column :people, :picture, :string, after: :headline
  end
end
