class GiftReceiversController < ApplicationController

  def index
    @gift_receivers = GiftReceiver.all
    @gift_receiver = GiftReceiver.new
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @gift_receivers }
    end
  end


  def show
    @gift_receiver = GiftReceiver.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @gift_receiver }
    end
  end
  def new
    @gift_receiver = GiftReceiver.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @gift_receiver }
    end
  end

  def edit
    @gift_receiver = GiftReceiver.find(params[:id])

  end

  def create
    @gift_receiver = GiftReceiver.new(params[:gift_receiver])
    respond_to do |format|
      if @gift_receiver.save
        session[:receivername]=@gift_receiver.name
        session[:receiverid]=@gift_receiver.id
        session[:totalamount]=@gift_receiver.coast
#        format.html { redirect_to(giftSelect_gift_receivers_path) }
         format.html { redirect_to(gift_groups_path) }
        
        format.xml  { render :xml => @gift_receiver, :status => :created, :location => @gift_receiver }
          
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @gift_receiver.errors, :status => :unprocessable_entity }
      end
    end
  end
  def update
    @gift_receiver = GiftReceiver.find(params[:id])

    respond_to do |format|
      if @gift_receiver.update_attributes(params[:gift_receiver])
        format.html { redirect_to(@gift_receiver, :notice => 'Gift receiver was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @gift_receiver.errors, :status => :unprocessable_entity }
      end
    end
  end
  def destroy
    @gift_receiver = GiftReceiver.find(params[:id])
    @gift_receiver.destroy

    respond_to do |format|
      format.html { redirect_to(gift_receivers_url) }
      format.xml  { head :ok }
    end
  end
  
  def giftSelect
    @gift_selected = GiftSelected.new
    @gift_selecteds = GiftSelected.find(:all,:conditions=>{:gift_receiver_id=>session[:receiverid]})

  end
end
