class Note < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :patient
end
