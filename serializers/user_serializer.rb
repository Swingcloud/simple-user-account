class UserSerializer
  def initialize(user)
    @user = user
  end

  def as_json(*)
    data = {
      id: @user.uid.to_s,
      created_at: @user.created_at,
      email: @user.email,
      telephone_number: @user.telephone_number,
      first_name: @user.first_name,
      last_name: @user.last_name,
      admin: @user.admin
    }
    data[:errors] = @user.errors if @user.errors.any?
    data
  end
end
