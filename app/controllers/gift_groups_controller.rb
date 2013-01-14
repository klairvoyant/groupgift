class GiftGroupsController < ApplicationController
  # GET /gift_groups
  # GET /gift_groups.xml
        before_filter :authenticate_user!, :only => [:sendmails,:index]
    
  
  
  def index
    
    @totalCoast=session[:totalamount]
    @individualCoast=0
    #@gift_groups = GiftGroup.all
    @gift_groups = GiftGroup.find(:all,:conditions=>{:gift_receiver_id=>session[:receiverid]})#.page params[:page]
    @receiverId= session[:receiverid]
    @receivename=session[:receivername]
    @gift_group = GiftGroup.new
    @gift_selecteds = GiftSelected.find(:all,:conditions=>{:gift_receiver_id=>session[:receiverid]})
        
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @gift_groups }
    end
  end

  # GET /gift_groups/1
  # GET /gift_groups/1.xml
  def show
    @gift_group = GiftGroup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @gift_group }
    end
  end

  # GET /gift_groups/new
  # GET /gift_groups/new.xml
  def new
    @gift_group = GiftGroup.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @gift_group }
    end
  end

  # GET /gift_groups/1/edit
  def edit
    @gift_group = GiftGroup.find(params[:id])
  end

  # POST /gift_groups
  # POST /gift_groups.xml
  def create
    @gift_group = GiftGroup.new(params[:gift_group])

    respond_to do |format|
      @gift_group.gift_receiver_id=session[:receiverid]
      if @gift_group.save
        format.html { redirect_to(:controller =>"gift_groups",:action =>"index") }
        
        #format.html { redirect_to(@gift_groups, :notice => 'Added successfully.') }
        format.xml  { render :xml => @gift_group, :status => :created, :location => @gift_group }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @gift_group.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /gift_groups/1
  # PUT /gift_groups/1.xml
  def update
    @gift_group = GiftGroup.find(params[:id])

    respond_to do |format|
      if @gift_group.update_attributes(params[:gift_group])
        format.html { redirect_to(@gift_group, :notice => 'Gift group was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @gift_group.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /gift_groups/1
  # DELETE /gift_groups/1.xml
  def destroy
    @gift_group = GiftGroup.find(params[:id])
    @gift_group.destroy

    respond_to do |format|
      format.html { redirect_to(gift_groups_url) }
      format.xml  { head :ok }
    end
  end
  def sendmails

    @gift_groups = GiftGroup.find(:all,:conditions=>{:gift_receiver_id=>session[:receiverid]})
    @receiverID=session[:receiverid]
    @receiver=session[:receivername]
    @individualCoast=params[:individualCoast]
    @dashboard=DashBoard.new
    @from=current_user.email
    @dashboard.log_in_email=@from
    @dashboard.gift_receiver_id=@receiverID
    @dashboard.save
    @gift_groups.each do |gift_group| 
        UserMailer.inviteletter(gift_group,@receiver,@from,@individualCoast).deliver
    end
    
    respond_to do |format|     
      format.html { redirect_to(:controller =>"finish",:action =>"index") }
    end
    
  end
  
  
end
