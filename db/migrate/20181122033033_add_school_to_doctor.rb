class AddSchoolToDoctor < ActiveRecord::Migration[5.2]
  def change
    add_column :doctors, :school, :string
  end
end
