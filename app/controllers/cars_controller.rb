class CarsController < ApplicationController
  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    if @car.save
      redirect_to new_car_path, notice: 'Success! Car has been added.'
    else
      redirect_to new_car_path, notice: 'Sorry, we encountered some errors.'
    end
  end

  private

  def car_params
    params.require(:car).permit(:color, :description, :year, :mileage)
  end
end
