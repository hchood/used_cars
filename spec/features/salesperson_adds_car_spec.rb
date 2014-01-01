require 'spec_helper'

feature 'Add new car', %Q{
  As a car salesperson
  I want to record a newly acquired car
  So that I can list it in my list
} do

  # Acceptance Criteria:

  # *   I must specify the color, year, mileage of the car.
  # *   Only years from 1980 and above can be specified.
  # *   I can optionally specify a description of the car.
  # *   If I enter all of the required information in the
  # required format, the car is recorded.
  # *   If I do not specify all of the required information
  # in the required formats, the car is not recorded and
  # I am presented with errors.
  # *   Upon successfully creating a car, I am
  # redirected so that I can create another car.

  scenario 'supplies valid attributes' do
    car = FactoryGirl.build(:car)

    visit 'cars/new'
    fill_in 'Color', with: car.color
    fill_in 'Year', with: car.year
    fill_in 'Mileage', with: car.mileage

    click_button 'Create Car'
    save_and_open_page
    expect(Car.all.count).to eq 1
    expect(page).to have_content 'Success! Car has been added.'
    expect(page).to have_content 'Add New Car'

  end

  scenario 'does not supply required attributes' do
    visit 'cars/new'
    click_button 'Create Car'

    expect(Car.all.count).to eq 0
    expect(page).to have_content 'Sorry, we encountered some errors.'

    within '.input.car.color' do
      expect(page).to have_content "can't be blank"
    end

    within '.input.car.year' do
      expect(page).to have_content "can't be blank"
    end

    within '.input.car.mileage' do
      expect(page).to have_content "can't be blank"
    end
  end

  scenario 'does not save a car with a year before 1980' do
    car = FactoryGirl.build(:car)

    visit 'cars/new'
    fill_in 'Color', with: car.color
    fill_in 'Year', with: car.year
    fill_in 'Mileage', with: car.mileage

    click_button 'Create Car'

    expect(Car.all.count).to eq 1
    expect(page).to have_content 'must be 1980 or later'
    expect(page).to have_content 'Sorry, we encountered some errors.'
  end
end
