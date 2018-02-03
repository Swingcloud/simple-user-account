class PaymentSerializer
  def initialize(payment)
    @payment = payment
  end

  def as_json(*)
    data = {
      id: @payment.uid.to_s,
      created_at: @payment.created_at.to_i,
      livemode: @payment.livemode,
      demo: @payment.demo,
      amount: @payment.amount,
      currency: @payment.currency,
      description: @payment.description,
      merchant_name: @payment.merchant_name,
      category: @payment.category,
      refunded: @payment.refunded,
      account_balance: @payment.account.balance,
      request_longitude: @payment.request_longitude,
      request_latitude: @payment.request_latitude,
      request_address: @payment.request_address,
      network_type: @payment.network_type,
      network_ip: @payment.network_ip,
      netwrok_operator: @payment.network_operator,
      wireless_access_point: @payment.wireless_access_point,
      status: @payment.status || 'succeeded'
    }
    data
  end
end
