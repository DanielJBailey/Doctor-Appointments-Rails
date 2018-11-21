class AddDateToAppointments < ActiveRecord::Migration[5.2]
  def change
    add_column :appointments, :date, :date
  end
end
