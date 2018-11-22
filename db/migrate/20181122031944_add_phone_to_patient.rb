class AddPhoneToPatient < ActiveRecord::Migration[5.2]
  def change
    add_column :patients, :phone, :string
  end
end
