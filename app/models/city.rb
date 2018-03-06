class City < ApplicationRecord
    has_attached_file :image, styles: { medium: "286x180>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
    has_many :restaurants
end