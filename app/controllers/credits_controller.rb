class CreditsController < ApplicationController

  # GET /credits
  # GET /credits.json
  def index
    @credits = Credit.paginate page: params[:page], order: ' created_at desc',
        per_page: 10
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @credits }
    end
  end

  # GET /credits/1
  # GET /credits/1.json
  def show
    begin
      @credit = Credit.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      logger.error "Attempt to access invalid cart #{params[:id]}"
      redirect_to :controller => "store" , :action => "index", notice: 'invalid request'
    else
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @credit }
      end
    end
  end

  # GET /credits/new
  # GET /credits/new.json
  def new
    @credit = Credit.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @credit }
    end
  end

  # GET /credits/1/edit
  def edit
    @credit = Credit.find(params[:id])
  end

  # POST /credits
  # POST /credits.json
  def create
    @credit = Credit.new(params[:credit])

    respond_to do |format|
      if @credit.save
        format.html { redirect_to @credit, notice: 'Credit was successfully created.' }
        format.json { render json: @credit, status: :created, location: @credit }
      else
        format.html { render action: "new" }
        format.json { render json: @credit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /credits/1
  # PUT /credits/1.json
  def update
    @credit = Credit.find(params[:id])
    respond_to do |format|
      if @credit.update_attributes(params[:credit])
        format.html { redirect_to @credit, notice: 'Credit was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @credit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /credits/1
  # DELETE /credits/1.json
  def destroy
    @credit = current_credit
    @credit.destroy
    session[:credit_id] = nil
    respond_to do |format|
      format.html { redirect_to :controller => "store", :action => "most_wanted" ,notice: 'Request has been removed' }
      format.json { head :no_content }
    end
  end
end
