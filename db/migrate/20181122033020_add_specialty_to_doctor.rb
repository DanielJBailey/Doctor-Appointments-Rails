class AddSpecialtyToDoctor < ActiveRecord::Migration[5.2]
  def change
    add_column :doctors, :specialty, :string
  end
end
