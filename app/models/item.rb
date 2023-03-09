class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  belongs_to :user
  has_one_attached :image

  belongs_to :category
  belongs_to :condition
  belongs_to :charge
  belongs_to :area
  belongs_to :days


  with_options presence: true do
  validates :user_id
  validates :image
  validates :name
  validates :text
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :condition_id, numericality: { other_than: 1 , message: "can't be blank"}  
  validates :charge_id, numericality: { other_than: 1, message: "can't be blank"}  
  validates :area_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :days_id, numericality: { other_than: 1 , message: "can't be blank"}  
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end
end
