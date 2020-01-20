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
 new_cart=[]
 counter=0 
 while counter < cart.length
 new_cart_item = find_item_by_name_in_collection(cart[counter][:item], new_cart)
 if new_cart_item != nil
   new_cart_item[:count] +=1 
 else
   new_cart_item = {
  
  
  
   }
  new_cart << new_cart_item
end

def apply_coupons(cart, coupons)
  hash = cart
  coupons.each do |coupon_hash|
    # add coupon to cart
    item = coupon_hash[:item]

    if !hash[item].nil? && hash[item][:count] >= coupon_hash[:num]
      temp = {"#{item} W/COUPON" => {
        :price => coupon_hash[:cost],
        :clearance => hash[item][:clearance],
        :count => 1
        }
      }
      
      if hash["#{item} W/COUPON"].nil?
        hash.merge!(temp)
      else
        hash["#{item} W/COUPON"][:count] += 1
        #hash["#{item} W/COUPON"][:price] += coupon_hash[:cost]
      end
      
      hash[item][:count] -= coupon_hash[:num]
    end
  end
  hash
end

def apply_clearance(cart)
  cart.each do |item, price_hash|
    if price_hash[:clearance] == true
      price_hash[:price] = (price_hash[:price] * 0.8).round(2)
    end
  end
  cart
end

def checkout(items, coupons)
  cart = consolidate_cart(items)
  cart1 = apply_coupons(cart, coupons)
  cart2 = apply_clearance(cart1)
  
  total = 0
  
  cart2.each do |name, price_hash|
    total += price_hash[:price] * price_hash[:count]
  end
  
  total > 100 ? total * 0.9 : total
  
end

