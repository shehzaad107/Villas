class VillasController < ApplicationController
  before_action :set_villa, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      @query = params[:query]
      @villas = Villa.where("name iLike '%#{params[:query]}%'")
    else
      @villas = Villa.all
    end
  end

  def new
    @villas = Villa.new
  end

  def create
    @villas = Villa.new(villa_params)
    if @villa.save
      redirect_to villas_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @villa.update(villa_params)
    redirect_to villa_path(@villa)
  end

  def destroy
    @villa.destroy
    redirect_to villas_path
  end

  private

  def set_villa
    @villa = Villa.find(params[:id])
  end

  def villa_params
    params.require(:villa).permit(:name, :address, :description, :price_per_night, :number_of_guests, :picture_url)
  end
end
