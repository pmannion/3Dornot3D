class TradesController < ApplicationController
  #before_filter :is_admin?
  skip_before_filter :authorize, only: [:new, :create]
  # GET /trades
  # GET /trades.json
  def index
    @products = Product.where(stock_status:'new' ) .order(:title)
    @cart = current_cart
    @credit = current_credit
    @trades = Trade.paginate page: params[:page], order: ' created_at desc',
        per_page: 10
   # @confirm = Trade.find_by_user_id_and_trade_id(user_id, trade_id)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @trades }
    end
  end

  # GET /trades/1
  # GET /trades/1.json
  def show
    begin
      @trade = Trade.find(params[:id])
      @cart = current_cart
      @credit = current_credit
    rescue ActiveRecord::RecordNotFound
      logger.error "Attempt to access invalid trade #{params[:id]}"
      redirect_to :controller => "store", :action => 'index', notice: 'Invalid action'
    else
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @trade }
      end
    end
  end



  def new
    @products = Product.where(wanted: 'yes')
    @cart = current_cart
    @credit = current_credit
    if @credit.credit_items.empty?
      redirect_to :controller => "store", :action => "most_wanted", notice: 'You have not selected any items'
      return
    end
    @trade =Trade.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @trade }
    end
  end

  def authorize
    unless User.find_by_id(session[:user_id])
      redirect_to login_url, notice: "Please log in"
    end
  end

  # GET /trades/1/edit
  def edit
    @trade = Trade.find(params[:id])

  end

  # POST /trades
  # POST /trades.json
  def create
    #@trade = Trade.new(params[:trade])
    @trade = current_user.trades.new(params[:trade])
    @cart = current_cart
    @credit = current_credit
    respond_to do |format|
      if @trade.save
        Credit.destroy(session[:credit_id])
        session[:credit_id] = nil
        format.html { redirect_to :controller => "store", :action => "thanks", notice: 'Trade was successfully created. You have 21 days to send your items' }
        format.json { render json: @trade, status: :created, location: @trade }
      else
        @credit = current_credit
        format.html { render action: "new" }
        format.json { render json: @trade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /trades/1
  # PUT /trades/1.json
  def update
    @trade = Trade.find(params[:id])

    respond_to do |format|
      if @trade.update_attributes(params[:trade])
        format.html { redirect_to @trade, notice: 'Trade was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @trade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trades/1
  # DELETE /trades/1.json
  def destroy
    @trade = Trade.find(params[:id])
    @trade.destroy
    respond_to do |format|
      format.html { redirect_to trades_url }
      format.json { head :no_content }
    end
  end
end
