class UserdataController < ApplicationController
  # GET /userdata
  # GET /userdata.json
  def index
    @userdata = Userdatum.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @userdata }
    end
  end

  # GET /userdata/1
  # GET /userdata/1.json
  def show
    @userdatum = Userdatum.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @userdatum }
    end
  end

  # GET /userdata/new
  # GET /userdata/new.json
  def new
    @userdatum = Userdatum.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @userdatum }
    end
  end

  # GET /userdata/1/edit
  def edit
    @userdatum = Userdatum.find(params[:id])
  end

  # POST /userdata
  # POST /userdata.json
  def create
    @userdatum = Userdatum.new(params[:userdatum])

    respond_to do |format|
      if @userdatum.save
        format.html { redirect_to @userdatum, notice: 'Userdatum was successfully created.' }
        format.json { render json: @userdatum, status: :created, location: @userdatum }
      else
        format.html { render action: "new" }
        format.json { render json: @userdatum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /userdata/1
  # PUT /userdata/1.json
  def update
    @userdatum = Userdatum.find(params[:id])

    respond_to do |format|
      if @userdatum.update_attributes(params[:userdatum])
        format.html { redirect_to @userdatum, notice: 'Userdatum was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @userdatum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /userdata/1
  # DELETE /userdata/1.json
  def destroy
    @userdatum = Userdatum.find(params[:id])
    @userdatum.destroy

    respond_to do |format|
      format.html { redirect_to userdata_url }
      format.json { head :no_content }
    end
  end
end
