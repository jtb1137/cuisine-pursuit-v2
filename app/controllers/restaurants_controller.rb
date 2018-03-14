class RestaurantsController < ApplicationController
    before_action :set_city
    before_action :set_restaurant, only: [:show, :edit, :update, :destroy, :favorite]
    skip_before_action :authenticate_user!, only: [:show]

    def index
        case params[:button]
        when "newest"
            @restaurants = @city.restaurants.newest
        when "oldest"
            @restaurants = @city.restaurants.oldest
        end
    end

    def new
        @restaurant = @city.restaurants.build
        @categories = 3.times.collect { @restaurant.categories.build }
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
        @categories = 3.times.collect { @restaurant.categories.build }
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
        params.require(:restaurant).permit(:name, :address1, :address2, :city, :state, :zipcode,
            :image, :submitted_by, category_ids:[], categories_attributes: [ :id, :name ])
    end

end
