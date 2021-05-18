class Attendance < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :title, :start_date, :duration,
    :description, :price, :location,
    presence: true
    
    validate :start_date_cannot_be_in_the_past

    validates :duration,
    :numericality => { :only_integer => true, :greater_than => 0 }
    
    validate :duration_must_be_multiple_of_5

    validates :title,
    :length => {:within => 5..140} 
    
    validates :description,
    :length => {:within => 20..1000}
    
    validates :price,
    :numericality => { :only_integer => true},
    :inclusion => { :in => 1..1000 }

    private

    # custom validator pour la start date
    def start_date_cannot_be_in_the_past
        errors.add(:start_date, 'cannot be in the past') if
        start_date < Time.zone.today
    end

    # custom validator pour la duration
    def duration_must_be_multiple_of_5
        errors.add(:duration, 'must be a multiple of 5') if
        duration%5 != 0
    end
end
