class Car < ActiveRecord::Base
  validates_presence_of :color
  validates_presence_of :year
  validates_presence_of :mileage

  validates_numericality_of :year
  validates_inclusion_of :year, in: 1980..Time.new.year, message: 'must be 1980 or later'
  validates_numericality_of :mileage
end
