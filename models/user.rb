class User < ActiveRecord::Base
  has_secure_password

  validates_presence_of :email

  before_create :set_uid
  after_create :init_account
  has_many :accounts

  private

  def set_uid
    self.uid = "#{self.class.to_s.downcase}_#{SecureRandom.base64(12)}"
  end

  def init_account
    self.accounts.create(
      name: "#{self.first_name}_#{self.last_name}_first_account",
      card_number: 16.times.map { rand(1..9) }.join.to_s,
      livemode: true,
      balance: 0,
      status: 'active'
    )
  end
end
