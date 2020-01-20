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
  while counter< cart.length
  new_cart_item = find_item_by_name_in_collection(cart[counter][:item], new_cart)
  if new_cart_item = !nil
    new_cart_item[:count] +=1 
  else
    new_cart_item = {
      :item=>
      :price=>
      :clearance
    }

end 

def apply_coupons(cart, coupons)

end

def apply_clearance(cart)

end

def checkout(cart, coupons)

end
