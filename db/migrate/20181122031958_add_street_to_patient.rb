class AddStreetToPatient < ActiveRecord::Migration[5.2]
  def change
    add_column :patients, :street, :string
  end
end
