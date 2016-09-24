class WorkPiecesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_work_piece, only: [:show, :update, :destroy]

  # GET /work_pieces
  def index
    # @work_pieces = WorkPiece.all

    # render json: @work_pieces
    work_pieces_of_worker = WorkPiece.where(worker_id: params[:worker_id])
    render json: work_pieces_of_worker
  end

  # GET /work_pieces/1
  def show
    render json: @work_piece
  end

  # POST /work_pieces
  def create
    @work_piece = WorkPiece.new(work_piece_params)

    if @work_piece.save
      render json: @work_piece, status: :created, location: @work_piece
    else
      render json: @work_piece.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /work_pieces/1
  def update
    if @work_piece.update(work_piece_params)
      render json: @work_piece
    else
      render json: @work_piece.errors, status: :unprocessable_entity
    end
  end

  # DELETE /work_pieces/1
  def destroy
    @work_piece.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_work_piece
      @work_piece = WorkPiece.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def work_piece_params
      params.require(:work_piece).permit(:date, :worker_id, :work_id, :piece_rate)
    end

    def workers_work_pieces_params
      params.require(:worker).permit(:id)
    end

end
