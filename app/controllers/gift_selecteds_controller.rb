class GiftSelectedsController < ApplicationController
  # GET /gift_selecteds
  # GET /gift_selecteds.xml
#  before_filter :authenticate_user!
  
  def index
    @gift_selecteds = GiftSelected.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @gift_selecteds }
    end
  end

  # GET /gift_selecteds/1
  # GET /gift_selecteds/1.xml
  def show
    @gift_selected = GiftSelected.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @gift_selected }
    end
  end

  # GET /gift_selecteds/new
  # GET /gift_selecteds/new.xml
  def new
    @gift_selected = GiftSelected.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @gift_selected }
    end
  end

  # GET /gift_selecteds/1/edit
  def edit
    @gift_selected = GiftSelected.find(params[:id])
  end

  # POST /gift_selecteds
  # POST /gift_selecteds.xml
  def create
    @gift_selected = GiftSelected.new(params[:gift_selected])

    respond_to do |format|
       @gift_selected.gift_receiver_id=session[:receiverid] 
      if @gift_selected.save
        #format.html { redirect_to(@gift_selected, :notice => 'Gift selected was successfully created.') }
        format.html { redirect_to(giftSelect_gift_receivers_path, :notice => 'Selected.') }
         
        format.xml  { render :xml => @gift_selected, :status => :created, :location => @gift_selected }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @gift_selected.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /gift_selecteds/1
  # PUT /gift_selecteds/1.xml
  def update
    @gift_selected = GiftSelected.find(params[:id])

    respond_to do |format|
      if @gift_selected.update_attributes(params[:gift_selected])
        format.html { redirect_to(@gift_selected, :notice => 'Gift selected was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @gift_selected.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /gift_selecteds/1
  # DELETE /gift_selecteds/1.xml
  def destroy
    @gift_selected = GiftSelected.find(params[:id])
    @gift_selected.destroy

    respond_to do |format|
      #format.html { redirect_to(gift_selecteds_url) }
      format.html { redirect_to(gift_receivers_path) }
      
      format.xml  { head :ok }
    end
  end
  def remove 
    @giftSelected=GiftSelected.find(params[:id])
    @giftSelected.destroy
     redirect_to(:controller=> "gift_receivers",:action =>"giftSelect")
    
  end
end
