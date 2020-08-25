# Class for serializing the post data. Doing this will help scalating
# the app and removing logic from the controller making it easier to read code.
class PostSerializer
  def initialize(post_object)
    @post = post_object
  end

  # serializer method to exclude data we dont need in our front end.
  def to_serialized_json
    @post.to_json(:except => [:created_at, :updated_at])
  end

end
