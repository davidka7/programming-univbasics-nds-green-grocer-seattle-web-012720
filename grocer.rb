def find_item_by_name_in_collection(name, collection)
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
