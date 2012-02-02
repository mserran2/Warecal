class SubRequestsController < ApplicationController
  # GET /sub_requests
  # GET /sub_requests.json
  def index
    @sub_requests = SubRequest.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sub_requests }
    end
  end

  # GET /sub_requests/1
  # GET /sub_requests/1.json
  def show
    @sub_request = SubRequest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sub_request }
    end
  end

  # GET /sub_requests/new
  # GET /sub_requests/new.json
  def new
    @sub_request = SubRequest.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sub_request }
    end
  end

  # GET /sub_requests/1/edit
  def edit
    @sub_request = SubRequest.find(params[:id])
  end

  # POST /sub_requests
  # POST /sub_requests.json
  def create
    @sub_request = SubRequest.new(params[:sub_request])

    respond_to do |format|
      if @sub_request.save
        format.html { redirect_to @sub_request, notice: 'Sub request was successfully created.' }
        format.json { render json: @sub_request, status: :created, location: @sub_request }
      else
        format.html { render action: "new" }
        format.json { render json: @sub_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sub_requests/1
  # PUT /sub_requests/1.json
  def update
    @sub_request = SubRequest.find(params[:id])

    respond_to do |format|
      if @sub_request.update_attributes(params[:sub_request])
        format.html { redirect_to @sub_request, notice: 'Sub request was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @sub_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sub_requests/1
  # DELETE /sub_requests/1.json
  def destroy
    @sub_request = SubRequest.find(params[:id])
    @sub_request.destroy

    respond_to do |format|
      format.html { redirect_to sub_requests_url }
      format.json { head :ok }
    end
  end
end
