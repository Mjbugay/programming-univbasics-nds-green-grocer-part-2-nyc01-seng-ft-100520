require_relative './part_1_solution.rb'

def apply_coupons(cart, coupons)
<<<<<<< HEAD
  coupons_index = 0

  while coupons_index < coupons.size do
    current_coupon = coupons[coupons_index]
    applicable_for_discount = find_item_by_name_in_collection( current_coupon[:item], cart )
    
      if ( applicable_for_discount[:count] / current_coupon[:num] >= 1 )
        cart.push( {:item => "#{current_coupon[:item]} W/COUPON",
                    :price => (current_coupon[:cost] / current_coupon[:num]).round(2),
                    :clearance => applicable_for_discount[:clearance],
                    :count => applicable_for_discount[:count] - ( applicable_for_discount[:count] % current_coupon[:num])})

        applicable_for_discount[:count] %= current_coupon[:num]
      end
    coupons_index += 1
  end
  cart
end	


=======
  
  coupons.each do |coupon| 
    coupon.each do |attribute, value| 
      name = coupon[:item] 
    
      if cart[name] && cart[name][:count] >= coupon[:num] 
        if cart["#{name} W/COUPON"] 
          cart["#{name} W/COUPON"][:count] += 1 
        else 
          cart["#{name} W/COUPON"] = {:price => coupon[:cost], 
          :clearance => cart[name][:clearance], :count => 1} 
        end 
  
      cart[name][:count] -= coupon[:num] 
    end 
  end 
end 
  cart 
end
>>>>>>> ace69180824f3a649754b18e405b1629dc37e237

def apply_clearance(cart)
  cart_index = 0
  ready_for_checkout = Array.new

  while cart_index < cart.size do
    current_item = cart[cart_index]
    
    if ( current_item[:clearance] )
      current_item[:price] = current_item[:price] - ( current_item[:price] * 0.20 )
    end
    
    ready_for_checkout.push( current_item )
    cart_index += 1 
  end
  ready_for_checkout
end	
 
 
def checkout(cart, coupons)
  checkout = consolidate_cart( cart )
  checkout = apply_coupons( checkout, coupons )
  checkout = apply_clearance( checkout )

  index = 0
  grand_total = 0

  while index < checkout.size do
    current_item_total = checkout[index][:price] * checkout[index][:count]
    current_item_total.round(2)
    grand_total += current_item_total
    index += 1
  end
  
  if ( grand_total > 100 )
    grand_total *= 0.90
  end
  
  grand_total
end
