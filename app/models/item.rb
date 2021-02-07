class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  has_one :order

  belongs_to :user
  has_one_attached :image

  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :shipping_day
  belongs_to_active_hash :shipping_user


  with_options presence: true do
    validates :image
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

  validates :price ,inclusion: { in: 300..9999999 ,message: '300~9999999円の間にしてください'}
  validates :price ,numericality: { with: /\A[0-9]+\z/, message: '半角数字を使用してください' }
end
