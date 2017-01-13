class Food < ActiveRecord::Base
  has_many :line_items
  #字段存在、is not null
  validates_presence_of :title,:description,:image_url
  #字段合法の判断
  validates_numericality_of :price
  #title
  validates_uniqueness_of :title
  #price
  validate :price_must_be_at_least_a_cent
  
  protected
    def price_must_be_at_least_a_cent
      errors.add(:price,'should be at least 0.01') if price.nil? || price < 0.01
  end
  def self.find_food_for_sale
    Food.find(:all,:order =>"title")
  end
end
