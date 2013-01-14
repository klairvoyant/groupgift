class GiftReceiver < ActiveRecord::Base
  has_many :gift_selecteds
  has_many :gift_groups
  has_many :dash_boards
  validates(:name, :presence => true)
  validates(:occassion, :presence => true)
  validates(:email, :presence => true, 
                    :length => {:minimum => 3, :maximum => 254},
                    :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i})
 validates(:coast, :presence => true,:numericality => true)                 
    
end
