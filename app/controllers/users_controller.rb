class UsersController < ApplicationController
  #before_filter :is_admin?

  def index
    #@users = User.all
    @users = User.find(:all)
    @products = Product.where(wanted: 'yes')
    @cart = current_cart
    @credit = current_credit
  end

  def new
    @user = User.new
    @products = Product.where(wanted: 'yes')
    @cart = current_cart
    @credit = current_credit
  end

  def welcome
    @products = Product.where(stock_status:'new' ) .order(:title)
    @cart = current_cart
    @credit = current_credit

    #@orders = Order.paginate page: params[:page], order: ' created_at desc',
    #    per_page: 3

    #the following is a variation on the solution used for pagination in products
    @history = Order.paginate(:per_page => 3,
                                 :page => params[:page],
                                 :order => 'created_at DESC').where(user_id:current_user[:id])

    @traded = Trade.paginate(:per_page => 3,
                                :page => params[:page],
                                :order => 'created_at DESC').where(user_id:current_user[:id])

    #@history = Order.where(user_id:current_user[:id])
    #@traded = Trade.where(user_id:current_user[:id])
    @orders = Order.all
    @trades = Trade.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @orders }
    end
  end

  #def edit added from agile
  def edit
    @user = User.find(params[:id])
    @products = Product.where(wanted: 'yes')
    @cart = current_cart
    @credit = current_credit
  end

  #def show added from agile
  def show
    @products = Product.where(wanted: 'yes')
    @cart = current_cart
    @credit = current_credit

    begin
      @user = User.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      logger.error "Attempt to access invalid user #{params[:id]}"
      redirect_to :controller => "store", :action => 'index', notice: 'Invalid action'
    else
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @user }
      end
    end
  end

  #def destroy added from agile
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  def create
    @user = User.new(params[:user])
    @products = Product.where(wanted: 'yes')
    @cart = current_cart
    @credit = current_credit
    if @user.save
      redirect_to login_path, :notice => 'User creation successful!'
    else
      render :action => 'new'
    end
  end

  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'Details were successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

end