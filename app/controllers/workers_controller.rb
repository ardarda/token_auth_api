class WorkersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_worker, only: [:show, :update, :destroy]

  # GET /workers
  def index
    # @workers = Worker.all

    # render json: @workers
    workers_of_current_user = Worker.where(user: current_user)
    render json: workers_of_current_user
  end

  # GET /workers/1
  def show
    render json: @worker
  end

  # POST /workers
  def create
    worker_params_with_user_id = worker_params.push(current_user)
    @worker = Worker.new(worker_params_with_user_id)

    if @worker.save
      render json: @worker, status: :created, location: @worker
    else
      render json: @worker.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /workers/1
  def update
    if @worker.update(worker_params)
      render json: @worker
    else
      render json: @worker.errors, status: :unprocessable_entity
    end
  end

  # DELETE /workers/1
  def destroy
    @worker.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_worker
      @worker = Worker.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def worker_params
      params.require(:worker).permit(:name, :phone, :email)
    end
end
