class StoreController < ApplicationController
  skip_before_filter :authorize






  def index
    @products = Product.where(stock_status:'new' ) .order(:title)
    @cart = current_cart
    @credit = current_credit
  end

  def used
    @products = Product.where(stock_status: 'used')
    @cart = current_cart
    @credit = current_credit
  end

  def most_wanted
    @products = Product.where(wanted: 'yes')
    @cart = current_cart
    @credit = current_credit
  end

  def thanks
    @products = Product.where(wanted: 'yes')
    @cart = current_cart
    @credit = current_credit
  end


  def info_wrapper
    #some computation
    render :update do |page|
      page["info_wrapper"].replace_html :partial => "some_partial"
    end
  end

end

