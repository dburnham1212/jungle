module CartHelper
  # Check if the current cart has any items
  def cart_not_empty?
    enhanced_cart.size > 0
  end
end
