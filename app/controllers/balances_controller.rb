class BalancesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_balance, only: [:show, :update, :destroy]

  def add_money(amount)
    @balance = Balance.where(user:current_user)
    currentAmount = @balance.TotalIncome;
    currentAmount += amount;
    @balance.TotalIncome = currentAmount;
    if @balance.save 
      render json: @balance
    else
      render json: @balance.errors
    end
  end

  def remove_money(amount)
    @balance = Balance.where(user:current_user)
    puts @balance
    currentAmount = @balance.TotalExpenses;
    currentAmount += amount;
    @balance.TotalIncome = currentAmount;

    logger.debug "balance attributes hash: #{current_user.balance.inspect} Balance reduceeed!!!!"

    if @balance.save 
      render json: @balance
    else
      render json: @balance.errors
    end
  end
  # helper_method :remove_money


  # GET current_user's current balance
  def current
    @balance = Balance.where(user: current_user)
    render json: @balance
  end

  # GET /balances
  def index
    @balances = Balance.all
    render json: @balances
  end

  # GET /balances/1
  def show
    render json: @balance
  end

  # POST /balances
  def create
    @balance = Balance.new(balance_params)

    if @balance.save
      render json: @balance, status: :created, location: @balance
    else
      render json: @balance.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /balances/1
  def update
    if @balance.update(balance_params)
      render json: @balance
    else
      render json: @balance.errors, status: :unprocessable_entity
    end
  end

  # DELETE /balances/1
  def destroy
    @balance.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_balance
      @balance = Balance.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def balance_params
      params.require(:balance).permit(:Difference, :TotalIncome, :TotalExpenses, :user_id)
    end

end
