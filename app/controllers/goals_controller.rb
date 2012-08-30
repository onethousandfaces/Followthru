class GoalsController < ApplicationController
  # GET /goals
  # GET /goals.json
  def index
    if params.has_key(:project_id) 
      ud = UserDataFactory.new.get current_user, Userdatum
      @goals = Goal.where("userdatum_id = ? AND project_id = ?", ud.id, params[:project])
    else
      @goals = Goal.where("userdatum_id = ?", ud.id)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @goals }
    end
  end

  # GET /goals/1
  # GET /goals/1.json
  def show
    ud = UserDataFactory.new.get current_user, Userdatum
    @goal = Goal.where("userdatum_id = ? AND id = ?", ud.id, params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @goal }
    end
  end

  # GET /goals/new
  # GET /goals/new.json
  def new
    @goal = Goal.new
    @goal.userdatum = UserDataFactory.new.get current_user, Userdatum

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @goal }
    end
  end

  # GET /goals/1/edit
  def edit
    ud = UserDataFactory.new.get current_user, Userdatum
    @goal = Goal.where("userdatum_id = ? AND id = ?", ud.id, params[:id])
  end

  # POST /goals
  # POST /goals.json
  def create
    @goal = Goal.new(params[:goal])
    @goal.userdatum = UserDataFactory.new.get current_user, Userdatum

    respond_to do |format|
      if @goal.save
        format.html { redirect_to @goal, notice: 'Goal was successfully created.' }
        format.json { render json: @goal, status: :created, location: @goal }
      else
        format.html { render action: "new" }
        format.json { render json: @goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /goals/1
  # PUT /goals/1.json
  def update
    ud = UserDataFactory.new.get current_user, Userdatum
    @goal = Goal.where("userdatum_id = ? AND id = ?", ud.id, params[:id])

    respond_to do |format|
      if @goal.update_attributes(params[:goal])
        format.html { redirect_to @goal, notice: 'Goal was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /goals/1
  # DELETE /goals/1.json
  def destroy
    ud = UserDataFactory.new.get current_user, Userdatum
    @goal = Goal.where("userdatum_id = ? AND id = ?", ud.id, params[:id])
    @goal.destroy

    respond_to do |format|
      format.html { redirect_to goals_url }
      format.json { head :no_content }
    end
  end
end
