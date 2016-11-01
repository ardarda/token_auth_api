class WorkPiecesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_work_piece, only: [:show, :update, :destroy]

  # GET /work_pieces
  def index
    # @work_pieces = WorkPiece.all

    # render json: @work_pieces
    work_pieces = WorkPiece.where(worker_id: params[:worker_id])
    if (work_pieces)
      render json: work_pieces
    else
      render json: work_pieces.errors, status: :unprocessable_entity
    end
  end

def indexWithWork
  work_pieces = WorkPiece.where(work_id: params[:work_id])
  if (work_pieces)
    render json: work_pieces
  else
    render json: work_pieces.errors, status: :unprocessable_entity
  end
  
end
  # GET /work_pieces/1
  def show
    render json: @work_piece
  end

  # POST /work_pieces
  def create
    @work_piece = WorkPiece.new(work_piece_params)

    if @work_piece.save
      expense = Expense.new(rate: @work_piece.piece_rate, work_piece: @work_piece, transaction_completed: @work_piece.is_paid, user: current_user)
      expense.work_id = @work_piece.work_id
      if expense.save
              render json: @work_piece, status: :created, location: @work_piece
      else
              render json: expense.errors, status: :unprocessable_entity
      end
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
      params.require(:work_piece).permit(:date, :worker_id, :work_id, :piece_rate, :is_paid)
    end

    def work_pieces_params
      params.require(:worker).permit(:id)
    end

end
