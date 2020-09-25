require 'pry'
require_relative './part_1_solution.rb'


def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
 counter = 0
  coupons.each do |coupon|
    item_in_cart = find_item_by_name_in_collection(coupon[:item], cart)
    cart_item_w_coupon = find_item_by_name_in_collection(coupon[:item] + " W/COUPON", cart)
    if cart_item_w_coupon && item_in_cart[:count] >= coupon[:num]
        cart_item_w_coupon[:count] += coupon[:num]
        item_in_cart[:count] -= coupon[:num]
    elsif item_in_cart && item_in_cart[:count] >= coupon[:num]
        cart << {
          :item => coupon[:item] + " W/COUPON",
          :price => coupon[:cost] / coupon[:num],
          :count => coupon[:num],
          :clearance => item_in_cart[:clearance]
        }
        item_in_cart[:count] -= coupon[:num]
    end
  end
  cart
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  new_price_hash = []
  cart.each do |item|
      if item[:clearance] 
       new_price = item[:price] = (item[:price] - (item[:price] * 0.20)).round(2)
       new_price_hash << {
         :item => item[:item],
         :price => new_price,
         :clearance => item[:clearance],
         :count => item[:count]
       }
      end 
    end
    new_price_hash 
  end 

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
  
  consolidated_cart = consolidate_cart(cart)
  cart_w_coupons = apply_coupons(consolidated_cart, coupons)
  final_cart = apply_clearance(cart_w_coupons)
  total = []
  i = 0 
  while i < final_cart.length 
    total << (final_cart[i][:price] * final_cart[i][:count])
    total_price = total.sum
    if total_price > 100
    total_price = total_price - (total_price * 0.10)
    end
    i += 1 
  end 
  total_price 
end
