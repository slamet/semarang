class Order < ActiveRecord::Base
has_many :line_items, dependent: :destroy	
attr_accessible :name, :address, :email, :pay_type
	#PAYMENT_TYPES = [ ["Check", 'C' ], ["Credit card", 'cc'], ["Purchase order",'p' ]
	
	validates :name, :address, :email, :pay_type, presence: true
	#validates :pay_type

def add_line_items_from_cart(cart)
   cart.line_items.each do |item|
   	item.cart_id = nil
   	line_items << item
   end
  end

   	
end