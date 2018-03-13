class Restaurant < ApplicationRecord
    has_attached_file :image, styles: { large: "1280x720#", medium: "286x180#" }, default_url: "/images/:style/missing.png",
        convert_options: {:medium => "-gravity center -extent 286x180"}
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

    validates :name, presence: true
    validates :address, presence: true
    validates :image, presence: true

    belongs_to :city

    has_many :restaurant_categories
    has_many :categories, through: :restaurant_categories

    accepts_nested_attributes_for :categories, reject_if: :all_blank

    has_many :favorite_restaurants
    has_many :favorited_by, through: :favorite_restaurants, source: :user

    # by_city(city)
    # by_category(category)
    # newest(days)
    # most_favorited
    #
    #
    #

    def categories_attributes=(category_attributes)
        category_attributes.values.each do |attribute|
            category = Category.find_or_create_by(attribute)
            self.categories << category
        end
    end

end