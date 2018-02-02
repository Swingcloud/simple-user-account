class Account < ActiveRecord::Base
  before_create :set_uid
  has_many :payments

  belongs_to :user

  validates_presence_of :name, :card_number
  validates_length_of :card_number, :is => 16, :message => 'Card number must be 16 digits'

  private

  def set_uid
    self.uid = "#{self.class.to_s.downcase}_#{SecureRandom.base64(12)}"
  end
end
