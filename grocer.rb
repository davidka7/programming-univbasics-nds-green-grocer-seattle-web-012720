def find_item_by_name_in_collection(name, collection)
  # Implement me first!
  #
  # Consult README for inputs and outputs
end

def consolidate_cart(cart)
  consol_cart = Hash.new
  cart.each do |item|
    if consol_cart[item.keys[0]] #Item with that key is already in consol cart
      consol_cart[item.keys[0]][:count] += 1

    else 
      item_name = item.keys[0]
      new_consol_cart_item = {}
      new_consol_cart_item[:price] = item[item_name][:price]
      new_consol_cart_item[:clearance] = item[item_name][:clearance]
      new_consol_cart_item[:count] = 1
      consol_cart[item_name] = new_consol_cart_item

  end 
  end 
  consol_cart
end

def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
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
