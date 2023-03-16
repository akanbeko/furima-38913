class OrderAddress
  include ActiveModel::Model
    
  attr_accessor :user_id, :item_id, :send_number, :area_id, :city, :address, :building, :phone_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :send_number, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :area_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A[0-9]{11}\z/, message: 'is invalid' }
    validates :token
  end
 
  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(order_id: order.id, send_number: send_number, area_id: area_id, city: city, address: address, building: building, phone_number: phone_number)
  end
end
