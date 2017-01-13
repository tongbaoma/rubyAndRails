class AddPriceToFood < ActiveRecord::Migration
  def self.up
    add_column :foods, :price, :decimal
  end

  def self.down
    remove_column :foods, :price
  end
end
