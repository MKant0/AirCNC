class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  before_action :set_chair, only: [:new, :create]
# al ser la ruta nesteada con chair, usamos el chair_id para encontrar la silla
  def index
    @bookings = policy_scope(Booking)
  end

  def show
    authorize @booking
    @chair = @booking.chair
  end

  def new
    @booking = Booking.new
    authorize @chair
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.chair = @chair
    @booking.user = current_user
    authorize @chair
    authorize @booking
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @booking
  end

  def update
    authorize @booking
    if @booking.update(booking_params)
      redirect_to booking_path(@booking)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @booking
    @booking.destroy
    redirect_to bookings_path, status: :see_other
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:date_start, :date_end)
  end

  def set_chair
    @chair = Chair.find(params[:chair_id])
  end
end
