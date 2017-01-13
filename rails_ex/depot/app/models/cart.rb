class Cart
  attr_reader :items
  def initialize
    @items = []
  end
#  def add_food(food)
#    @items << food
#  end
  def add_food(food)
    current_item = @items.find{|item| item.food == food}
    if current_item
      current_item.increment_quantity
    else
      @items << CartItem.new(food)
    end
  end
  
  def total_price
    @items.sum{|item| item.price}
  end
end




