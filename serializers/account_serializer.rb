class AccountSerializer
  def initialize(account)
    @account = account
  end

  def as_json(*)
    data = {
      id: @account.uid.to_s,
      created_at: @account.created_at.to_i,
      livemode: @account.livemode,
      name: @account.name,
      balance: @account.balance.to_s,
      card_number: @account.card_number,
      status: @account.status
    }
    data
  end
end
