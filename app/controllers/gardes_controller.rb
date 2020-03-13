class GardesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_garde, only: [:show, :edit, :update, :destroy]


  def index
    # @query = params[:query]
    # @query_on_category = params[:category]

    # if @query.present?
    #   @gardes = Garde.geocoded.global_search(params[:query])
    # elsif @query_on_category.present?
    #   categories = @query_on_category.select { |k, v| v == '1' }.keys
    #   @gardes = Garde.geocoded.select { |m| categories.include?(m.category) }
    # else
      @gardes = Garde.All
  end

  #   @markers = @gardes.map do |meal|
  #     {
  #       lat: meal.latitude,
  #       lng: meal.longitude,
  #       infoWindow: render_to_string(partial: "info_window", locals: { garde: garde }),
  #       image_url: helpers.asset_url('carottes.png')
  #     }
  #   end
  # end

  def show
    @garde = Garde.find(params[:id])
    @reservation = Reservation.new
  end

  def view_my_gardes
    @my_gardes = Garde.where(user: current_user)

    my_received_gardes = []
    @my_gardes.each do |garde|
      my_received_gardes << garde.reservation
    end

    @my_received_gardes = my_received_gardes.flatten
  end



  def view_my_garde
    @my_gardes = Garde.where(user: current_user)
    @my_garde = @my_gardes.find(params[:id])
  end

  def new
    @garde = Garde.new
  end

  def create
    @garde = Garde.new(garde_params)
    @garde.user = current_user
    if @garde.save
      redirect_to garde_path(@garde)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @garde.update(garde_params)
    redirect_to garde_path(@garde)
  end

  def destroy
    @garde.destroy
    redirect_to my_gardes_path
  end

  private

  def set_garde
    @garde = Garde.find(params[:id])
  end

  def garde_params
    params.require(:garde).permit(:name, :description, :address, :category, :quantity_max, :start_availability_date, :end_availability_date)
  end
end
