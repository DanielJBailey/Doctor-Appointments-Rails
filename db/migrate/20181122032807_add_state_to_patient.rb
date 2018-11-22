class AddStateToPatient < ActiveRecord::Migration[5.2]
  def change
    add_column :patients, :state, :string
  end
end
