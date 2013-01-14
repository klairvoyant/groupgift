class GiftSelected < ActiveRecord::Base
  belongs_to :gift_receiver
  validates(:title, :presence => true)
  validates(:amount, :presence => true, :numericality => true)
  
end
