require 'spec_helper'

describe Car do
  it { should validate_presence_of :color }
  it { should validate_presence_of :year }
  it { should validate_presence_of :mileage }

  it { should validate_numericality_of(:year).greater_than_or_equal_to(1980).less_than_or_equal_to(Time.new.year) }
  it { should validate_numericality_of :mileage }
end
