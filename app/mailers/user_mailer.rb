class UserMailer < ActionMailer::Base
#  def support_notification(gift_group,receiver,from)
#    @sender=gift_group
#    @receiver=receiver
#
#    @from=from
#	    mail(:to => @sender.email,
#	         :from => from,
#	         :subject => "Share a gift for" )
#	 end
   
  def inviteletter(gift_group,receiver,from,individualCoast)
    @sender=gift_group
    @receiver=receiver
    @from=from
    @individualCoast=individualCoast
    
	    mail(:to => @sender.email,
	         :from => from,
	         :subject => "Share a gift for #{@receiver}" )
    
  end
end
