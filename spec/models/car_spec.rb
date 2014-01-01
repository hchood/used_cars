require 'spec_helper'

describe Car do
  this_year = Time.new.year

  it { should validate_presence_of :color }
  it { should validate_presence_of :year }
  it { should validate_presence_of :mileage }

  it { should validate_numericality_of :year }
  it { should ensure_inclusion_of(:year).in_range(1980..this_year) }
  it { should validate_numericality_of :mileage }
end
