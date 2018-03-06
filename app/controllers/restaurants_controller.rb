class RestaurantsController < ApplicationController
    before_action :set_city

    def new
        @restaurant = @city.restaurants.build
    end

    def create
        @restaurant = @city.restaurants.build(restaurant_params)

        if @restaurant.save
            redirect_to city_restaurant_path(@city, @restaurant)
        else
            render 'new'
        end
    end

    def show
        @restaurant = @city.restaurants.find(params[:id])
    end

    private
    def set_city
        @city = City.find_by_id(params[:city_id])
    end

    def restaurant_params
        params.require(:restaurant).permit(:name, :street_number, :street)
    end

end
