class Restaurant < ApplicationRecord
    has_attached_file :image, styles: { large: "1000x640#", medium: "286x180#" }, default_url: "/images/:style/missing.png",
        convert_options: {:medium => "-gravity center -extent 286x180"}
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

    validates :name, presence: true
    validates :image, presence: true

    has_many :restaurant_categories
    has_many :categories, through: :restaurant_categories
    accepts_nested_attributes_for :categories, reject_if: proc { |attribute| attribute['name'] === "" }
    has_many :favorite_restaurants
    has_many :favorited_by, through: :favorite_restaurants, source: :user

    scope :newest, -> { order("created_at DESC").limit(25) }
    scope :oldest, -> { order("created_at ASC").limit(25) }

    def categories_attributes=(category_attributes)
        
        category_attributes.values.each do |attribute|
            if attribute["name"] != ""
                category = Category.find_or_create_by(attribute)
                self.categories << category 
            end
        end
    end

end