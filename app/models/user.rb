class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :notes, dependent: :destroy
  has_many :patients, through: :notes

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
