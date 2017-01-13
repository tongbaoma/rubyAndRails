class StoreController < ApplicationController
  def index
    @foods = Food.find_food_for_sale
    @cart = find_cart
  end
  def add_to_cart
    food = Food.find(params[:id])
    @cart = find_cart
    @cart.add_food(food)
    redirect_to:action => 'index'
  rescue ActiveRecord::RecordNotFound
    logger.error("Attempt to access invailld product #{params[:id]}")
    redirect_to:action => 'index'
  end
  def empty_cart
    session[:cart] = nil
    flash[:notice] = "Your Cart is currently empty!!!"
    redirect_to :action => 'index'
  end
  
  def checkout
    @cart = find_cart
    if @cart.items.empty?
      redirect_to_index("Your cart is Empty")
    else
      @order = Order.new
    end
  end
  
  def save_order
    @cart = find_cart
    @order = Order.new(params[:order])
    logger.debug "#params[:order]"
    @order.add_line_items_from_cart(@cart)
    if @order.save
      session[":cart"] = nil
      flash[:notice] = "Thanks for your order!!!"
      redirect_to :action => 'index'
    else
      render :action=>'checkout'
    end
  end
  
   def order_index
     @orders = Order.find(:all,:order=>:id)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @orders }
    end
   end
  
   def lineitem_index
#     @line_items = LineItem.find(:all)
     

     order_id =  params[:id]
     @line_items = LineItem.find(:all,:conditions => "order_id = '#{order_id}'")

#    respond_to do |format|
#      format.html # index.html.erb
#      format.xml  { render :xml => @lineitems }
#    end
   end
  
  private
  def find_cart
    session[:cart] ||= Cart.new
  end
  
  protected
  def authorize 
  end
end
