class Account < ActiveRecord::Base
  before_create :set_uid
  has_many :payments

  belongs_to :user
  
  private

  def set_uid
    self.uid = "#{self.class.to_s.downcase}_#{SecureRandom.base64(12)}"
  end
end
