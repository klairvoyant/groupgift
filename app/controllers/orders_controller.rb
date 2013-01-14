class OrdersController < ApplicationController
  # GET /orders
  # GET /orders.xml
  def index
    @orders = Order.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @orders }
    end
  end

  # GET /orders/1
  # GET /orders/1.xml
  def show
    @order = Order.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @order }
    end
  end

  # GET /orders/new
  # GET /orders/new.xml
  def new
    @order = Order.new
    @pass=false
    
    session[:coast_per_individual]=params[:coast]
    session[:gift_receiver]=params[:receiverID]
    session[:senderID]=params[:sender]
    @num=Payment.find(:all,:conditions=>{:gift_group_id=>session[:senderID],:gift_receiver_id=>session[:gift_receiver]})
    if @num.count==0 
      
      @pass=true
    
    end
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @order }
    end
  end

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
  end

  # POST /orders
  # POST /orders.xml
  def create
    @order = Order.new(params[:order])
    @order.ip_address=request.remote_ip
    @order.cart_id=1
    @coasttopay=session[:coast_per_individual]

    respond_to do |format|
      if @order.save
        if @order.purchase(@coasttopay)
          @payment = Payment.new
          @payment.gift_group_id=session[:senderID]
          @payment.gift_receiver_id=session[:gift_receiver]
          @payment.payed=@coasttopay
          @payment.save
          format.html { redirect_to(finish_payedsuccessful_path) }
          
        else 
          format.html { redirect_to(finish_payedfailure_path) }
        end
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @order.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /orders/1
  # PUT /orders/1.xml
  def update
    @order = Order.find(params[:id])

    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to(@order, :notice => 'Order was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @order.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.xml
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to(orders_url) }
      format.xml  { head :ok }
    end
  end
end
