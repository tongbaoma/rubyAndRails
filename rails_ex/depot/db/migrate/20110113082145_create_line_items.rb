class CreateLineItems < ActiveRecord::Migration
  def self.up
    create_table :line_items do |t|
      t.integer :food_id, :null=>false, :options => "CONSTRAINT fk_line_item_foods PEFERENCES foods(id)"
      t.integer :order_id,:null=>false, :options => "CONSTRAINT fk_line_item_orders PEFERENCES orders(id)"
      t.integer :quantity, :null => false
      t.decimal :total_price,:null =>false,:precision =>8,:scale=>2

      t.timestamps
    end
  end

  def self.down
    drop_table :line_items
  end
end
