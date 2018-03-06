class RestaurantsController < ApplicationController
    before_action :set_city
    before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

    def new
        @restaurant = @city.restaurants.build
    end

    def create
        @restaurant = @city.restaurants.build(restaurant_params)
        @restaurant.city_id = @city.id

        if @restaurant.save
            redirect_to city_restaurant_path(@city, @restaurant)
        else
            render 'new'
        end
    end

    def show
    end

    def edit
    end

    def update
        if @restaurant.update(restaurant_params)
            redirect_to city_restaurant_path(@city, @restaurant)
        else
            render 'new'
        end
    end

    def destroy
        @restaurant.destroy
        redirect_to city_path(@city)
    end

    private
    def set_city
        @city = City.find(params[:city_id])
    end

    def set_restaurant
        @restaurant = Restaurant.find(params[:id])
    end

    def restaurant_params
        params.require(:restaurant).permit(:name, :street_number, :street, :image)
    end

end
