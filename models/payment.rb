class Payment < ActiveRecord::Base
  before_create :set_uid
  belongs_to :account

  validates_presence_of :amount
  validates_numericality_of :amount, greater_than: 0

  private

  def set_uid
    self.uid = "pay_#{SecureRandom.base64(12).tr("+/", "-_")}"
  end
end
