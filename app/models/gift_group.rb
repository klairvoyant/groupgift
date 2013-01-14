class GiftGroup < ActiveRecord::Base
  belongs_to :gift_receiver
  validates(:name, :presence => true)
  validates(:email, :presence => true, 
                    :length => {:minimum => 3, :maximum => 254},
                    :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i})
  
  
end
