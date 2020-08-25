# Class for serializing the product data. Doing this will help scalating
# the app and removing logic from the controller making it easier to read code.
class ProductSerializer
  def initialize(product_object)
    @product = product_object
  end

  # serializer method to exclude data we dont need in our front end.
  def to_serialized_json
    @product.to_json(:except => [:created_at, :updated_at])
  end
end
