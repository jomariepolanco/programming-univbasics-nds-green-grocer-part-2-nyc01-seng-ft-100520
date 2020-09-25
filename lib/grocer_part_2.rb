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
  cart.each do |item|
    item.each do |k,v|
      if item[:clearance] == true 
        item[:price] = ((1 - 0.20) * item[:price]).round(2)
      end 
    end 
  end 
  
  #price reduced by 20% if clearance = true 
  #iterate through cart 
  # if clearance of item == true 
  #reduce price by 20 %
  #else do nothing 
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
end
