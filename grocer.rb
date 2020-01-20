def find_item_by_name_in_collection(name, collection)
  counter=0 
  while counter< collection.length 
    if collection[counter][:item] == name
      return collecction[counter]
      
  
  
  
  # Implement me first!
  #
  # Consult README for inputs and outputs
end

def consolidate_cart(cart)
  

  final_hash = {}
  cart.each do|element_hash| 
    element_name = element_hash.keys[0]

    if final_hash.has_key?(element_name)
      final_hash[element_name][:count] += 1 
    else 
      final_hash[element_name] = {
       count: 1, 
       price: element_hash[element_name][:price],
       clearance: element_hash[element_name][:clearance]
      }
    end 
  end 
  final_hash
end 

def apply_coupons(cart, coupons)
   coupons.each do |coupon|
    item = coupon[:item]
    item_with_coupon = "#{item} W/COUPON"
    if cart.has_key?(item)
      if cart[item][:count] >= coupon[:num] && !cart.has_key?(item_with_coupon)
        cart[item_with_coupon] = {price: coupon[:cost] / coupon[:num], clearance: cart[item][:clearance], count: coupon[:num]}
        cart[item][:count] -= coupon[:num]
      elsif cart[item][:count] >= coupon[:num] && cart.has_key?(item_with_coupon)
        cart[item_with_coupon][:count] += coupon[:num]
        cart[item][:count] -= coupon[:num]
      end 
    end 
  end 
  cart
end

def apply_clearance(cart)
cart.each do |product_name, stats|
    stats[:price] -= stats[:price] * 0.2 if stats[:clearance]
  end
  cart 

end

def checkout(cart, coupons)
 hash_cart = consolidate_cart(cart)
  applied_coupons = apply_coupons(hash_cart, coupons)
  applied_discount = apply_clearance(applied_coupons)
  total = applied_discount.reduce(0) { |acc, (key, value)| acc += (value[:count] * value[:price])}
  total > 100 ? total * 0.9 : total 

end
