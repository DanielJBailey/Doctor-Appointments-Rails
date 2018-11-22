class AddCityToPatient < ActiveRecord::Migration[5.2]
  def change
    add_column :patients, :city, :string
  end
end
