User.destroy_all
p "Creating users"
u1 = User.create :name => 'Ana', :email => "ana@ga", :password => 'chicken', :admin => true
u2 = User.create :name => 'Kait', :email => "kait@ga", :password => 'chicken', :admin => true
u3 = User.create :name => 'Kian', :email => "kian@ga", :password => 'chicken', :admin => true
u4 = User.create :name => 'Eva', :email => "eva@ga", :password => 'chicken', :admin => false
puts "There are #{ User.count } users"

Product.destroy_all
p "Creating products"
p1 = Product.create :name => "Garlic Bread" , :category => "Starter", :price => 5.50, :image => "", :stars => 5
p2 = Product.create :name => "Traditional Bruschetta", :category => "Starter", :price => 10.90, :image => "", :stars => 4
p3 = Product.create :name => "Arancini Pomodoro", :category => "Starter", :price => 15.90, :image => ""
p4 = Product.create :name => "Garlic Prawns", :category => "Starter", :price => 18.90, :image => ""
p5 = Product.create :name => "Calamari Fritti", :category => "Starter", :price => 15.50, :image => "", :stars => 3
p6 = Product.create :name => "Arrabiata", :category => "Pasta", :price => 18.90, :image => "", :stars => 4
p7 = Product.create :name => "Puttanesca", :category => "Pasta", :price => 18.90, :image => ""
p8 = Product.create :name => "Napolitana", :category => "Pasta", :price => 18.90, :image => ""
p9 = Product.create :name => "Pesto", :category => "Pasta", :price => 18.90, :image => "", :stars => 2
p10 = Product.create :name => "Bolognese", :category => "Pasta", :price => 18.90, :image => "", :stars => 5
p11 = Product.create :name => "Carbonara", :category => "Pasta", :price => 18.90, :image => "", :stars => 5
p12 = Product.create :name => "Marinara", :category => "Pasta", :price => 23.90, :image => ""
p13 = Product.create :name => "Lasagne", :category => "Pasta", :price => 18.90, :image => "", :stars => 5
p14 = Product.create :name => "Chicken Cacciatore", :category => "Main", :price => 24.90, :image => ""
p15 = Product.create :name => "Chicken Funghi", :category => "Main", :price => 24.90, :image => "", :stars => 3
p16 = Product.create :name => "Veal Marsala", :category => "Main", :price => 24.90, :image => ""
p17 = Product.create :name => "Veal Boscaiola", :category => "Main", :price => 24.90, :image => ""
p18 = Product.create :name => "Grain Fed Sirloin", :category => "Main", :price => 29.90, :image => ""
p19 = Product.create :name => "Wagyu", :category => "Main", :price => 29.90, :image => "", :stars => 5
p20 = Product.create :name => 'Margherita', :category => "Pizza", :price => 18, :image => ""
p21 = Product.create :name => 'Napoletana', :category => "Pizza", :price => 18, :image => "", :stars => 3
p22 = Product.create :name => 'Tropical', :category => "Pizza", :price => 18, :image => "", :stars => 4
p23 = Product.create :name => 'Capriccosa', :category => "Pizza", :price => 18.50, :image => ""
p24 = Product.create :name => 'Pepperoni', :category => "Pizza", :price => 18, :image => "", :stars => 4
p25 = Product.create :name => 'Seafood', :category => "Pizza", :price => 19.90, :image => ""
p26 = Product.create :name => 'Vegetarian', :category => "Pizza", :price => 18, :image => "", :stars => 5
p27 = Product.create :name => 'Supreme', :category => "Pizza", :price => 22, :image => "", :stars => 4
p28 = Product.create :name => 'Tiramisu', :category => "Dessert", :price => 10.90, :image => "", :stars => 5
p29 = Product.create :name => 'Vanilla Pannacotta', :category => "Dessert", :price => 9, :image => "", :stars => 4
p30 = Product.create :name => "Belgium Chocolate Mousse", :category => "Dessert", :price => 9, :image => "", :stars => 5
p31 = Product.create :name => 'Cheesecake', :category => "Dessert", :price => 10.90, :image => ""
p32 = Product.create :name => 'Chocolate Mud Cake', :category => "Dessert", :price => 10.90, :image => "", :stars => 5
p33 = Product.create :name => 'Nutella Pizza', :category => "Dessert", :price => 10, :image => ""
puts "There are #{ Product.count } products"


Order.destroy_all
p "Creating orders"
o1 = Order.create :total_price => 71.10, :user_id => u1.id, :kind => "Pick-up"
o2 = Order.create :total_price => 91.40, :user_id => u4.id, :kind => "Delivery"
o3 = Order.create :total_price => 65.80, :user_id => u1.id, :kind => "Pick-up"
o4 = Order.create :total_price => 40.00, :user_id => u2.id, :kind => "Pick-up"
o5 = Order.create :total_price => 56.7, :user_id => u3.id, :kind => "Delivery"
puts "There are #{ Order.count } orders"

LineItem.destroy_all
puts "Creating line items"
l1 = LineItem.create :quantity => 1, :product_id => p1.id, :order_id => o1.id
l2 = LineItem.create :quantity => 1, :product_id => p6.id, :order_id => o1.id
l3 = LineItem.create :quantity => 1, :product_id => p17.id, :order_id => o1.id
l4 = LineItem.create :quantity => 2, :product_id => p32.id, :order_id => o1.id
l5 = LineItem.create :quantity => 1, :product_id => p2.id, :order_id => o2.id
l6 = LineItem.create :quantity => 1, :product_id => p3.id, :order_id => o2.id
l7 = LineItem.create :quantity => 2, :product_id => p11.id, :order_id => o2.id
l8 = LineItem.create :quantity => 2, :product_id => p28.id, :order_id => o2.id
l9 = LineItem.create :quantity => 1, :product_id => p13.id, :order_id => o3.id
l10 = LineItem.create :quantity => 1, :product_id => p16.id, :order_id => o3.id
l11 = LineItem.create :quantity => 1, :product_id => p27.id, :order_id => o3.id
l12 = LineItem.create :quantity => 1, :product_id => p24.id, :order_id => o4.id
l13 = LineItem.create :quantity => 1, :product_id => p27.id, :order_id => o4.id
l14 = LineItem.create :quantity => 1, :product_id => p2.id, :order_id => o5.id
l15 = LineItem.create :quantity => 1, :product_id => p19.id, :order_id => o5.id
l16 = LineItem.create :quantity => 1, :product_id => p31.id, :order_id => o5.id
puts "There are #{ LineItem.count } line_items"
