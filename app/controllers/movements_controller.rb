class MovementsController < ApplicationController
  before_action :set_movement, only: %i[ show edit update destroy ]
  before_action :set_group, only: %i[index show new edit update create destroy]
  load_and_authorize_resource

  # GET /movements or /movements.json
  def index
    @movements = Movement.all
    @movement_page = true
  end

  # GET /movements/1 or /movements/1.json
  def show
  end

  # GET /movements/new
  def new
    @movement = Movement.new
    @movement.group_ids << @group.id
    @new_transaction_page = true
  end

  # GET /movements/1/edit
  def edit
  end

  # POST /movements or /movements.json
  def create
    @movement = Movement.new(movement_params)
    # @movement = current_user.movements.new(group_movement_params)
    # @movement.user_id = current_user.id
    # @group_movement = @movement.group_movements.create(movement_params)

    respond_to do |format|
      if @movement.save
        format.html { redirect_to group_url(@group), notice: "Movement was successfully created." }
        format.json { render :show, status: :created, location: @movement }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @movement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movements/1 or /movements/1.json
  def update
    respond_to do |format|
      if @movement.update(movement_params)
        format.html { redirect_to group_url(@group), notice: "Movement was successfully updated." }
        format.json { render :show, status: :ok, location: @movement }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @movement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movements/1 or /movements/1.json
  def destroy
    @movement.destroy

    respond_to do |format|
      format.html { redirect_to movements_url, notice: "Movement was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movement
      @movement = Movement.find(params[:id])
    end

    def set_group
      @group = Group.find(params[:group_id])
    end

    # Only allow a list of trusted parameters through.
    def movement_params
      # params.require(:movement).permit(:name, :amount)
      params.require(:movement).permit(:name, :amount, group_ids: []).with_defaults(user_id: current_user.id)
    end
end
