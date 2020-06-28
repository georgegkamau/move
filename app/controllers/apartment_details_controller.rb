class ApartmentDetailsController < ApplicationController
  before_action :set_apartment_detail, only: [:show, :edit, :update, :destroy]

  # GET /apartment_details
  # GET /apartment_details.json
  def index
    @apartment_details = ApartmentDetail.all
  end

  # GET /apartment_details/1
  # GET /apartment_details/1.json
  def show
  end

  # GET /apartment_details/new
  def new
    @apartment_detail = ApartmentDetail.new
  end

  # GET /apartment_details/1/edit
  def edit
  end

  # POST /apartment_details
  # POST /apartment_details.json
  def create
    @apartment_detail = ApartmentDetail.new(apartment_detail_params)
    @apartment = Apartment.find(apartment_detail_params['apartment_id']) 
    @apartment_detail.apartment = @apartment 

    respond_to do |format|
      if @apartment_detail.save
        format.html { redirect_to @apartment_detail, notice: 'Apartment detail was successfully created.' }
        format.json { render :show, status: :created, location: @apartment_detail }
      else
        format.html { render :new }
        format.json { render json: @apartment_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /apartment_details/1
  # PATCH/PUT /apartment_details/1.json
  def update
    @apartment_id = @apartment_detail.apartment_id

    respond_to do |format|
      if @apartment_detail.update(apartment_detail_params)
        format.html { redirect_to apartment_path(@apartment_id), notice: 'Apartment detail was successfully updated.' }
        format.json { render :show, status: :ok, location: apartment_path(@apartment_id) }
      else
        format.html { render :edit }
        format.json { render json: @apartment_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /apartment_details/1
  # DELETE /apartment_details/1.json
  def destroy
    @apartment_detail.destroy
    respond_to do |format|
      format.html { redirect_to apartment_details_url, notice: 'Apartment detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_apartment_detail
      @apartment_detail = ApartmentDetail.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def apartment_detail_params
      params.require(:apartment_detail).permit(:housing_type, :rent, :deposit, :bedrooms, :bathrooms, :available, :sq_foot, :description, :washer_dryer, :laundry, :pets, :street_parking, :parking, :dishwasher, :central_air, :swimming_pool, :gym, :apartment_id, pictures: [], videos: [])
    end
end
