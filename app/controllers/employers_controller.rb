class EmployersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_employer, only: [:show, :update, :destroy]

  # GET /employers
  def index
    # @employers = Employer.all

    # render json: @employers


      employers_of_current_user = Employer.where(user: current_user)
      render json: employers_of_current_user
  end

  # GET /employers/1
  def show
    render json: @employer
  end

  # POST /employers
  def create
    @employer = Employer.new(employer_params)
    @employer.user = current_user
    if @employer.save
      render json: @employer, status: :created, location: @employer
    else
      render json: @employer.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /employers/1
  def update
    if @employer.update(employer_params)
      render json: @employer
    else
      render json: @employer.errors, status: :unprocessable_entity
    end
  end

  # DELETE /employers/1
  def destroy
    @employer.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employer
      @employer = Employer.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def employer_params
      params.require(:employer).permit(:name)
    end
end
