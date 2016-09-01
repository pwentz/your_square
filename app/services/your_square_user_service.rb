class YourSquareUserService
  attr_reader :connection

  def instantiate_user(id, token)
    User.first_or_create(
      uid: id,
      token: token
    )
  end
end
