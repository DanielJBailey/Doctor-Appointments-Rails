class Doctor < ApplicationRecord
    has_many :patients, through: :appointments
    has_many :appointments
end
