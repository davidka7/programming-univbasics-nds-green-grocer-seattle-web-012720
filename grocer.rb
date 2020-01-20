def find_item_by_name_in_collection(name, collection)
  counter=0 
  
  while counter< collection.length 
    if collection[counter][:item] == name
      return collection[counter]
    end
    counter+=1 
  end
  
  
  
  # Implement me first!
  #
  # Consult README for inputs and outputs
end

def consolidate_cart(cart)
   hash = {}
  cart.each do |item_hash|
    item_hash.each do |name, price_hash|
      if hash[name].nil?
        hash[name] = price_hash.merge({:count => 1})
      else
        hash[name][:count] += 1
      end
    end
  end
  hash
end

def apply_coupons(cart, coupons)
coupons.each do |coupon|
    item = coupon[:item]
    if cart.has_key?(item)
      if !cart["#{item} W/COUPON"] && cart[item][:count] >= coupon[:num]
         cart["#{item} W/COUPON"] = {price: coupon[:cost] / coupon[:num], clearance: cart[item][:clearance], count: coupon[:num]}
         cart[item][:count] -= coupon[:num]
     elsif cart["#{item} W/COUPON"] && cart[item][:count] >= coupon[:num]
      cart["#{item} W/COUPON"][:count] += coupon[:num]
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
  applied_clearance = apply_clearance(applied_coupons)
  total = applied_clearance.reduce(0) { |acc, (key, value)| acc += value[:price] * value[:count]}
  total > 100 ? total * 0.90 : total
end
