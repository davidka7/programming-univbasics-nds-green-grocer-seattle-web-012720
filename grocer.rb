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
  