class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :product_type
  has_rich_text :description
  has_one_attached :image 

  enum condition: {
    poor: 1,
    used: 2,
    good_condition: 3,
    brand_new: 4
  }

  enum genre: {
    rock: 1,
    electronic: 2,
    hip_hop: 3,
    jazz: 4,
    folk: 5,
    classical: 6,
    rhythm_and_blues: 7,
    country: 8,
    pop: 9,
    indie_rock: 10,
    reggae: 11,
    blues: 12,
    international: 13,
    other: 14
  }


end
