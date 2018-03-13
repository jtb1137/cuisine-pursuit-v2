class RestaurantsController < ApplicationController
    before_action :set_city
    before_action :set_restaurant, only: [:show, :edit, :update, :destroy, :favorite]
    skip_before_action :authenticate_user!, only: [:show]

    def index
    end

    def new
        @restaurant = @city.restaurants.build
    end

    def create
        @restaurant = @city.restaurants.build(restaurant_params)
        @restaurant.city_id = @city.id
        @restaurant.submitted_by = current_user.id

        if @restaurant.save
            redirect_to city_restaurant_path(@city, @restaurant)
        else
            render 'new'
        end
    end

    def show
        @favorite = FavoriteRestaurant.find_by(user: current_user, restaurant: @restaurant).present?
        @submitted = User.find(@restaurant.submitted_by)
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

    def favorite
        button = params[:button]
        if button == "favorite"
            current_user.favorites << @restaurant
            redirect_to city_restaurant_path(@city, @restaurant)
        elsif button == "unfavorite"
            current_user.favorites.destroy(@restaurant)
            redirect_to city_restaurant_path(@city, @restaurant)
        end
    end

    private
    def set_city
        @city = City.find(params[:city_id])
    end

    def set_restaurant
        @restaurant = Restaurant.find(params[:id])
    end

    def restaurant_params
        params.require(:restaurant).permit(:name, :address, :image, :submitted_by, category_ids:[], categories_attributes: [ :name ])
    end

end
