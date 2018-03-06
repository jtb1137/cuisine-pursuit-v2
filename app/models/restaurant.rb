class Restaurant < ApplicationRecord
    has_attached_file :image, styles: { large: "1000x720>", medium: "286x180>", thumb: "100x100>" }, default_url: "/images/:style/missing.png",
        convert_options: {:medium => "-gravity center -extent 286x180"}
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
    belongs_to :city
end
