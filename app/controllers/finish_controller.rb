class FinishController < ApplicationController
  def index
    @dashboard = DashBoard.find(:all,:conditions=>{:log_in_email=>current_user.email})    
    @count=0
  @totalCoast=0
  @payed=0 
  @totalPayed=0
  end
  def payedsuccessful
    
  end
  def payedfailure
    
  end
  def cancelgift
    
    @payment = Payment.find(:all,:conditions=>{:gift_receiver_id=>params[:receiverID]})
    
    @gift_receiver =GiftReceiver.find(:first,:conditions=>{:id=>params[:receiverID]})
    @gift_receiver.destroy
    
    @gift_group=GiftGroup.find(:all,:conditions=>{:gift_receiver_id=>params[:receiverID]})
    @gift_group.each do | gift |
      gift.destroy
    end
#   @gift_selecteds = GiftSelected.find(:all,:conditions=>{:gift_receiver_id=>params[:receiverID]})
    @gift_selecteds = GiftReceiver.find(:all,:conditions=>{:id=>params[:receiverID]})
    @gift_selecteds.each do | selected |
      selected.destroy
    end
    
    
     @dashboard = DashBoard.find(:first,:conditions=>{:gift_receiver_id=>params[:receiverID]})    
     @dashboard.destroy
    
    respond_to do |format|     
      format.html { redirect_to(:controller =>"finish",:action =>"index") }
    end
    
  end

end
