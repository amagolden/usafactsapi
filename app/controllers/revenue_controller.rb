class RevenueController < ApplicationController
  def index
    @revenue = Revenue.all
    render json: @revenue
  end

  def create
    @revenue = Revenue.new(revenue_params)

    if @revenue.save
      render json: @revenue, status: :created
    else
      render json: {error: 'Revenue creation failed'}, status: :unprocessable_entity
    end
  end

  def show
    @revenue = revenue.find(params[:id])

    if @revenue
      render json: @revenue, status: :ok
    else
      render json: { error: 'Revenue not found' }, status: :not_found
    end
  end

  def update
    @revenue = Revenue.find(params[:id])

    if @revenue.update(owner_params)
      render json: @revenue
    else
      render json: { error: 'Revenue update failed' }, status: :unprocessable_entity
    end
  end

  def destroy
    @revenue = Revenue.find(params[:id])

    if @revenue.destroy
      render json: { message: 'Revenue successfully deleted' }, status: :ok
    else
      render json: { error: 'Revenue deletion failed' }, status: :internal_server_error
    end
  end

  private

  def revenue_params
    params.permit(:name, :amount, :year)
  end

end
