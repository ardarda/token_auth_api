require 'test_helper'

class WorkPiecesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @work_piece = work_pieces(:one)
  end

  test "should get index" do
    get work_pieces_url, as: :json
    assert_response :success
  end

  test "should create work_piece" do
    assert_difference('WorkPiece.count') do
      post work_pieces_url, params: { work_piece: { date: @work_piece.date, piece_rate: @work_piece.piece_rate, work_id: @work_piece.work_id, worker_id: @work_piece.worker_id } }, as: :json
    end

    assert_response 201
  end

  test "should show work_piece" do
    get work_piece_url(@work_piece), as: :json
    assert_response :success
  end

  test "should update work_piece" do
    patch work_piece_url(@work_piece), params: { work_piece: { date: @work_piece.date, piece_rate: @work_piece.piece_rate, work_id: @work_piece.work_id, worker_id: @work_piece.worker_id } }, as: :json
    assert_response 200
  end

  test "should destroy work_piece" do
    assert_difference('WorkPiece.count', -1) do
      delete work_piece_url(@work_piece), as: :json
    end

    assert_response 204
  end
end
