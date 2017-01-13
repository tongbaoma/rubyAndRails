class CartItem
  attr_reader :food,:quantity
  def initialize(food)
    @food = food
    @quantity = 1
  end
  def increment_quantity
    @quantity += 1
  end
  
  def title
    @food.title
  end
  def price
    @food.price * quantity
  end
end