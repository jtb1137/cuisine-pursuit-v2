class Restaurant < ApplicationRecord
    has_attached_file :image, styles: { large: "1000x720>", medium: "286x180>", thumb: "100x100>" }, default_url: "/images/:style/missing.png",
        convert_options: {:medium => "-gravity center -extent 286x180"}
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

    validates :name, presence: true
    validates :street_number, presence: true
    validates :street, presence: true
    validates :image, presence: true

    belongs_to :city


    
end


create_table "restaurants", force: :cascade do |t|
    t.string "name"
    t.integer "street_number"
    t.string "street"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "city_id"
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
  end