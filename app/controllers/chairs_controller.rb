class ChairsController < ApplicationController
  before_action :set_chair, only: %i[show edit update destroy]
  def index
    @chairs = policy_scope(Chair)
  end

  def show
    authorize @chair
  end

  def new
    @chair = Chair.new
    authorize @chair
  end

  def create
    @chair = Chair.new(chair_params)
    @chair.user = current_user
    authorize @chair
    if @chair.save
      redirect_to chair_path(@chair)
    else
      render :new, status: :unporcessable_entity
    end
  end


  def edit
    authorize @chair
  end

  def update
    authorize @chair
    @chair.update(chair_params)
  end

  def destroy
    authorize @chair
    @chair.destroy
    redirect_to chairs_path, status: :see_other
  end

  private

  def set_chair
    @chair = Chair.find(params[:id])
  end

  def chair_params
    params.require(:chair).permit(:name, :address, :description, :price, photos: [])
  end
end
