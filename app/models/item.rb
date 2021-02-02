class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one_attached :image

  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :shipping_day
  belongs_to_active_hash :shipping_user

  with_options presence: true do
  validates :title
  validates :description
  validates :category_id
  validates :condition_id
  validates :shipping_user_id
  validates :shipping_area_id
  validates :shipping_day_id
  validates :price
  end

  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :condition_id
    validates :shipping_user_id
    validates :shipping_area_id
    validates :shipping_day_id
  end
end
