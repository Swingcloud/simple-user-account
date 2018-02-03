class Account < ActiveRecord::Base
  before_create :set_uid
  has_many :payments

  belongs_to :user

  validates_presence_of :name, :card_number
  validates_length_of :card_number, is: 16, message: 'Card number must be 16 digits'
  validates_numericality_of :balance, greater_than_or_equal_to: 0

  private

  def set_uid
    self.uid = "acc_#{SecureRandom.base64(12).tr("+/", "-_")}"
  end
end
