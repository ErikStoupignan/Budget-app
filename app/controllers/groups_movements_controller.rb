class GroupMovementsController < ApplicationController
  before_action :set_group_movement, only: %i[ show edit update destroy ]
  before_action :set_group, only: %i[index show new edit update create destroy]
  load_and_authorize_resource

  # GET /group_movements or /group_movements.json
  def index
    @group_movements = @group.movements
  end

  # GET /group_movements/1 or /group_movements/1.json
  def show
  end

  # GET /group_movements/new
  def new
    @group_movement = GroupMovement.new
    @group_movement.group_ids << @group.id
  end

  # GET /group_movements/1/edit
  def edit
  end

  # POST /group_movements or /group_movements.json
  def create
    @group_movement = GroupMovement.new(group_movement_params)

    respond_to do |format|
      if @group_movement.save
        format.html { redirect_to group_movement_url(@group_movement), notice: "Group movement was successfully created." }
        format.json { render :show, status: :created, location: @group_movement }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @group_movement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /group_movements/1 or /group_movements/1.json
  def update
    respond_to do |format|
      if @group_movement.update(group_movement_params)
        format.html { redirect_to group_movement_url(@group_movement), notice: "Group movement was successfully updated." }
        format.json { render :show, status: :ok, location: @group_movement }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @group_movement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /group_movements/1 or /group_movements/1.json
  def destroy
    @group_movement.destroy

    respond_to do |format|
      format.html { redirect_to group_movements_url, notice: "Group movement was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group_movement
      @group_movement = GroupMovement.find(params[:id])
    end

    def set_group
      @group = Group.find(params[:group_id])
    end

    # Only allow a list of trusted parameters through.
    def group_movement_params
      params.require(:group_movement).permit(:name, :amount, group_ids: []).with_defaults(user_id: current_user.id)
    end
end
