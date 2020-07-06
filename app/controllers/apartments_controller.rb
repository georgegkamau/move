class ApartmentsController < ApplicationController
  before_action :authenticate_user!, except: [ :index,:show]
  before_action :set_apartment, only: [:show, :edit, :update, :destroy]
  # before_action :verify_account, except: [ :index,:show]

  # GET /apartments
  # GET /apartments.json
  def index
    @apartments = Apartment.all
  end

  # GET /apartments/1
  # GET /apartments/1.json
  def show
    # VAR
    if current_user
    current_user_id = current_user.id 
    end
    apartment_user_id = @apartment.user_id

    # Pix
    if @apartment.apartment_detail.pictures.attached?
    @image = @apartment.apartment_detail.pictures.first
    end

    # is this one i posted
    @my_apartment = false
    @applied = false
    if current_user
      if current_user_id == apartment_user_id
       @my_apartment = true
      end

    if Apply.find_by(user_id: current_user_id, apartment_id: @apartment.id)
      @applied = true 
      app = Apply.find_by(user_id: current_user_id, apartment_id: @apartment.id)
      @applied_id = app.id
    end


    end

    # apply
    @apply = Apply.new


    
  end

  # GET /apartments/new
  def new
    @apartment = Apartment.new
  end

  # GET /apartments/1/edit
  def edit
  end

  # POST /apartments
  # POST /apartments.json
  def create
    @apartment = Apartment.new(apartment_params) 
    @apartment.user = current_user 
    @apartment_detail_id

    if @apartment.save
      @apartment_detail = ApartmentDetail.new()
      @apartment_detail.apartment = @apartment  
      @apartment_detail.save
      @apartment_detail_id = @apartment_detail.id
 
      respond_to do |format|
        if @apartment.save
          format.html { redirect_to edit_apartment_detail_path(@apartment_detail.id), notice: 'Add your apartment details' }
          format.json { render :show, status: :created, location: new_apartment_detail_path }
        else
          format.html { render :new }
          format.json { render json: @apartment.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /apartments/1
  # PATCH/PUT /apartments/1.json
  def update
    respond_to do |format|
      if @apartment.update(apartment_params)
        format.html { redirect_to @apartment, notice: 'Apartment was successfully updated.' }
        format.json { render :show, status: :ok, location: @apartment }
      else
        format.html { render :edit }
        format.json { render json: @apartment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /apartments/1
  # DELETE /apartments/1.json
  def destroy
    @apartment.destroy
    respond_to do |format|
      format.html { redirect_to apartments_url, notice: 'Apartment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  # my apartments
  def myapartments
    @apartments = current_user.apartments.all
  end

  def myteams 
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_apartment
      @apartment = Apartment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def apartment_params
      params.require(:apartment).permit(:street_address, :apt, :city, :state, :zip_code, :user_id)
    end
end

