class LineItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :food
  
  def self.form_cart_item(cart_item)
    li = self.new
    li.food = cart_item.food
    li.quantity = cart_item.quantity
    li.total_price = cart_item.price
    li
  end
end
