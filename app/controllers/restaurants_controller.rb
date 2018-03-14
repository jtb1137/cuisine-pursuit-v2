class RestaurantsController < ApplicationController
    before_action :set_restaurant, only: [:show, :edit, :update, :destroy, :favorite]
    skip_before_action :authenticate_user!, only: [:show]

    def index
        @restaurants = Restaurant.all
    end

    def new
        @restaurant = Restaurant.new
        @categories = 3.times.collect { @restaurant.categories.build }
    end

    def create
        @restaurant = Restaurant.new(restaurant_params)
        @restaurant.submitted_by = current_user.id

        if @restaurant.save
            redirect_to restaurant_path(@restaurant)
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
            redirect_to restaurant_path(@restaurant)
        else
            render 'new'
        end
    end

    def destroy
        @restaurant.destroy
        redirect_to root_path
    end

    def favorite
        button = params[:button]
        if button == "favorite"
            current_user.favorites << @restaurant
            redirect_to restaurant_path(@restaurant)
        elsif button == "unfavorite"
            current_user.favorites.destroy(@restaurant)
            redirect_to restaurant_path(@restaurant)
        end
    end

    private
    def set_restaurant
        @restaurant = Restaurant.find(params[:id])
    end

    def restaurant_params
        params.require(:restaurant).permit(:name, :address1, :address2, :city, :state, :zipcode,
            :image, :submitted_by, category_ids:[], categories_attributes: [ :id, :name ])
    end

end
