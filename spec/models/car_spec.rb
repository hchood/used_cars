require 'spec_helper'

describe Car do
  it { should validate_presence_of :color }
  it { should validate_presence_of :year }
  it { should validate_presence_of :mileage }

  it { should validate_numericality_of :year }
  it { should validate_numericality_of :mileage }

  it 'should reject a car if year is out of range' do
    next_year = Time.new.year + 1

    car1 = FactoryGirl.build(:car, year: 1970)
    car2 = FactoryGirl.build(:car, year: next_year)

    expect(car1).to_not be_valid
    expect(car2).to_not be_valid
  end
end
