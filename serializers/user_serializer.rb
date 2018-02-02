class UserSerializer
  def initialize(user)
    @user = user
  end

  def as_json(opts)
    data = {
      id: @user.uid.to_s,
      created_at: @user.created_at.to_i,
      email: @user.email,
      telephone_number: @user.telephone_number,
      first_name: @user.first_name,
      last_name: @user.last_name,
      admin: @user.admin,
    }
    data[:account] = AccountSerializer.new(@user.accounts.first) unless opts[:account] == false
    data[:errors] = @user.errors if@user.errors.any?
    data
  end
end
