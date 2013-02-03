class ProductsController < ApplicationController
  before_filter :authenticate, :except => [:index, :show]
  #before_filter :is_admin?
  # GET /products
  # GET /products.json
  def index
    @products = Product.where(stock_status:'new' ) .order(:title)

    #following line conlicting with pagination on products
    #@products = Product.search(params[:search_query])

    @cart = current_cart
    @credit = current_credit

    #@products = Product.paginate page: params[:page], order: ' created_at desc',
    #    per_page: 4

    #variation on a solution to search and pagination working together from the server side forum on moodle:
    @products = Product.paginate(:per_page => 4,
                                     :page => params[:page],
                                     :order => 'created_at DESC').search(params[:search_query])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    begin
      @product = Product.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      logger.error "Attempt to access invalid product #{params[:id]}"
      redirect_to :controller => "store", :action => 'index', notice: 'Invalid action'
    else
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @product }
      end
    end
  end

  # GET /products/new
  # GET /products/new.json
  def new
    @product = Product.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
  end

  # POST /products
  # POST /products.json
  def create
    @product = current_user.products.new(params[:product])
    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render json: @product, status: :created, location: @product }
      else
        format.html { render action: "new" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.json
  def update
    @product = Product.find(params[:id])
    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end
end
