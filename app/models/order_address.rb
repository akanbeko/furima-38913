class OrderAddress
  include ActiveModel::Model
    
  attr_accessor :user, :item, :send_number, :area_id, :city, :address, :building, :phone_number, :token

  with_options presence: true do
    validates :user
    validates :item
    validates :send_number, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :area, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A[0-9]{11}\z/, message: 'is invalid' }
    #validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Order.create(order_id: order.id, send_number: send_number, area_id: area_id, city: city, address: address, building: building, phone_number: phone_number)
  end
end
