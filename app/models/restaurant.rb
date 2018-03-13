class Restaurant < ApplicationRecord
    has_attached_file :image, styles: { large: "1280x720#", medium: "286x180#" }, default_url: "/images/:style/missing.png",
        convert_options: {:medium => "-gravity center -extent 286x180"}
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

    validates :name, presence: true
    validates :street_number, presence: true
    validates :street_number, numericality: { only_integer: true }
    validates :street, presence: true
    validates :image, presence: true

    belongs_to :city

    has_many :favorite_restaurants
    has_many :favorited_by, through: :favorite_restaurants, source: :user
end
