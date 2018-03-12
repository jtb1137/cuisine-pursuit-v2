class CitiesController < ApplicationController
    before_action :set_city, only: [:show, :edit, :update, :destroy]
    skip_before_action :authenticate_user!, only: [:index, :show]

    def index
        @cities = City.all
    end

    def show
    end

    def new
        @city = City.new
    end
    
    def create
        @city = City.new(city_params)

        if @city.save
            redirect_to city_path(@city)
        else
            render 'new'
        end
    end

    def edit
    end

    def update
        if @city.update(city_params)
            redirect_to city_path(@city)
        else
            render 'edit'
        end
    end

    def destroy
        @city.destroy
        redirect_to root_path
    end

    private

    def city_params
        params.require(:city).permit(:name, :state, :image)
    end

    def set_city
        @city = City.find(params[:id])
    end
end
