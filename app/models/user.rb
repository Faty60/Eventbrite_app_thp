class User < ApplicationRecord
  has_many :attendances
  has_many :events, through: :attendances
  has_many :admins, foreign_key: 'admin_id', class_name: "Event"

end
