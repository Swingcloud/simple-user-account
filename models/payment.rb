class Payment < ActiveRecord::Base
  before_create :set_uid
  belongs_to :account

  private

  def set_uid
    self.uid = "pay_#{SecureRandom.base64(12)}"
  end
end
