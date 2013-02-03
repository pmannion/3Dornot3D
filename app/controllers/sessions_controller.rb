class SessionsController < ApplicationController
  def create
    @products = Product.where(wanted: 'yes')
    @cart = current_cart
    @credit = current_credit

    if user = User.authenticate(params[:email], params[:password])
      session[:user_id] = user.id
      redirect_to :controller => "users", :action => "welcome", :notice => "Logged in successfully"
    else
      flash.now[:alert] = "Invalid login/password combination"
      render :action => 'new'
    end
  end

  def destroy
    reset_session
    redirect_to root_path, :notice => "You successfully logged out"
  end
  def new
    @products = Product.where(wanted: 'yes')
    @cart = current_cart
    @credit = current_credit
  end
end

