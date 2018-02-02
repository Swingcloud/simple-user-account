class User < ActiveRecord::Base
  before_create :set_uid
  has_one :account

  private

  def set_uid
    self.uid = "#{self.class.to_s.downcase}_#{SecureRandom.base64(12)}"
  end
end
