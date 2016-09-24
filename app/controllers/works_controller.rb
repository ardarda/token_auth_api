class WorksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_work, only: [:show, :update, :destroy]

  # GET /works
  def index
    # @works = Work.all
    if current_user
      works_of_current_user = Work.where(user: current_user)
      render json: works_of_current_user
    else  
    end
    
  end

  # GET /works/1
  def show
    render json: @work
  end

  # POST /works
  def create
    @work = Work.new(work_params)

    if @work.save
      render json: @work, status: :created, location: @work
    else
      render json: @work.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /works/1
  def update
    if @work.update(work_params)
      render json: @work
    else
      render json: @work.errors, status: :unprocessable_entity
    end
  end

  # DELETE /works/1
  def destroy
    @work.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_work
      @work = Work.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def work_params
      params.require(:work).permit(:name, :user_id, :employer_id, :address)
    end
end
