# Class for serializing the user data. Doing this will help scalating
# the app and removing logic from the controller making it easier to read code.
class UserSerializer
  def initialize(user_object)
    @user = user_object
  end

  # serializer method to exclude data we dont need in our front end.
  def to_serialized_json
    @user.to_json(:except => [:password_digest, :created_at, :updated_at])
  end
end
