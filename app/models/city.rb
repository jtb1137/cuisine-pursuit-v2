class City < ApplicationRecord
    has_attached_file :image, styles: { large: "1000x720>", medium: "286x180>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

    validates :name, presence: true
    validates :name, uniqueness: true
    validates :state, presence: true
    validates :image, presence: true
    
    has_many :restaurants
end