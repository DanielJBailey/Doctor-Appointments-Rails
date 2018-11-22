class AddLanguageToPatient < ActiveRecord::Migration[5.2]
  def change
    add_column :patients, :language, :string
  end
end
