class AddSexToPatient < ActiveRecord::Migration[5.2]
  def change
    add_column :patients, :sex, :string
  end
end
