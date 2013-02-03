class CreditItemsController < ApplicationController
  # GET /credit_items
  # GET /credit_items.json
  def index
    @credit_items = CreditItem.all
    @credit_items = CreditItem.paginate page: params[:page], order: ' created_at desc',
        per_page: 10

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @credit_items }
    end
  end

  # GET /credit_items/1
  # GET /credit_items/1.json
  def show
    begin
      @credit_item = CreditItem.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      logger.error "Attempt to access invalid credit item #{params[:id]}"
      redirect_to :controller => "store", :action => 'index', notice: 'Invalid action'
    else
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @credit_item }
      end
    end
  end

  # GET /credit_items/new
  # GET /credit_items/new.json
  def new
    @credit_item = CreditItem.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @credit_item }
    end
  end

  # GET /credit_items/1/edit
  def edit
    @credit_item = CreditItem.find(params[:id])
  end

  # POST /credit_items
  # POST /credit_items.json
  def create
    @credit = current_credit
    product = Product.find(params[:product_id])
    @credit_item = @credit.add_credit(product.id)
    respond_to do |format|
      if @credit_item.save
        format.html { redirect_to :controller => "store", :action => "most_wanted" }
        format.js
        format.json { render json: @credit_item, status: :created, location: @credit_item }
      else
        format.html { render action: "new" }
        format.json { render json: @credit_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /credit_items/1
  # PUT /credit_items/1.json
  def update
    @credit_item = CreditItem.find(params[:id])
    respond_to do |format|
      if @credit_item.update_attributes(params[:credit_item])
        format.html { redirect_to @credit_item, notice: 'Credit item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @credit_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /credit_items/1
  # DELETE /credit_items/1.json
  def destroy
    @credit_item = CreditItem.find(params[:id])
    @credit_item.destroy
    respond_to do |format|
      format.html { redirect_to credit_items_url }
      format.json { head :no_content }
    end
  end
end
