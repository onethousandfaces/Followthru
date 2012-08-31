class PledgeTypesController < ApplicationController
  # GET /pledge_types
  # GET /pledge_types.json
  def index
    ud = UserDataFactory.new.get current_user, Userdatum
    if params.has_key?(:project_id) 
      @pledge_types = PledgeType.where("userdatum_id = ? AND project_id = ?", ud.id, params[:project_id])
    else
      @pledge_types = PledgeType.where("userdatum_id = ?", ud.id)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pledge_types }
    end
  end

  # GET /pledge_types/1
  # GET /pledge_types/1.json
  def show
    ud = UserDataFactory.new.get current_user, Userdatum
    @pledge_type = PledgeType.where("userdatum_id = ? AND id = ?", ud.id, params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pledge_type }
    end
  end

  # GET /pledge_types/new
  # GET /pledge_types/new.json
  def new
    @pledge_type = PledgeType.new
    @pledge_type.userdatum = UserDataFactory.new.get current_user, Userdatum

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pledge_type }
    end
  end

  # GET /pledge_types/1/edit
  def edit
    ud = UserDataFactory.new.get current_user, Userdatum
    @pledge_type = PledgeType.where("userdatum_id = ? AND id = ?", ud.id, params[:id])
  end

  # POST /pledge_types
  # POST /pledge_types.json
  def create
    @pledge_type = PledgeType.new(params[:pledge_type])
    @pledge_type.userdatum = UserDataFactory.new.get current_user, Userdatum

    respond_to do |format|
      if @pledge_type.save
        format.html { redirect_to @pledge_type, notice: 'Pledge type was successfully created.' }
        format.json { render json: @pledge_type, status: :created, location: @pledge_type }
      else
        format.html { render action: "new" }
        format.json { render json: @pledge_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pledge_types/1
  # PUT /pledge_types/1.json
  def update
    ud = UserDataFactory.new.get current_user, Userdatum
    @pledge_type = PledgeType.where("userdatum_id = ? AND id = ?", ud.id, params[:id])

    respond_to do |format|
      if @pledge_type.update_attributes(params[:pledge_type])
        format.html { redirect_to @pledge_type, notice: 'Pledge type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pledge_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pledge_types/1
  # DELETE /pledge_types/1.json
  def destroy
    ud = UserDataFactory.new.get current_user, Userdatum
    @pledge_type = PledgeType.where("userdatum_id = ? AND id = ?", ud.id, params[:id])
    @pledge_type.destroy

    respond_to do |format|
      format.html { redirect_to pledge_types_url }
      format.json { head :no_content }
    end
  end
end
