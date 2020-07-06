class AppliesController < ApplicationController
  before_action :authenticate_user!, except: [ :index,:show]
  before_action :set_apply, only: [:show, :edit, :update, :destroy]
  # before_action :verify_account, except: [ :index,:show] 

  # GET /applies
  # GET /applies.json
  def index
    @applies = current_user.applies
  end

  # GET /applies/1
  # GET /applies/1.json
  def show
  end

  # GET /applies/new
  def new
    @apply = Apply.new
  end

  # GET /applies/1/edit
  def edit
  end

  # POST /applies
  # POST /applies.json
  def create
    @apply = Apply.new(apply_params) 
    @apartment = Apartment.find(@apply['apartment_id']) 
    @apply.user = current_user 
    @apply.apartment  = @apartment 

    respond_to do |format|
      if @apply.save
        format.html { redirect_to apartment_path(@apartment.id), notice: 'Apply was successfully created.' }
        format.json { render :show, status: :created, location: @apply }
      else
        format.html { render :new }
        format.json { render json: @apply.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /applies/1
  # PATCH/PUT /applies/1.json
  def update
    respond_to do |format|
      if @apply.update(apply_params)
        format.html { redirect_to @apply, notice: 'Apply was successfully updated.' }
        format.json { render :show, status: :ok, location: @apply }
      else
        format.html { render :edit }
        format.json { render json: @apply.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /applies/1
  # DELETE /applies/1.json
  def destroy
    @apply.destroy
    respond_to do |format|
      format.html { redirect_to applies_url, notice: 'Apply was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def applications
     
    myapartmemts_ids = current_user.apartments.ids
    applications_arr = []

    # apt = Apartment.find 3
    # @apply = apt.applies.ids
    # # @applies = apt.applies.ids
    # @applies = Apply.where(id: @apply ).all.order( 'created_at DESC' )
    
    

    myapartmemts_ids.each do |x| 
      apartment = Apartment.find x
      applications_arr.push(apartment.applies.ids ) 
    end
    @apply = applications_arr.flatten
    @applies = Apply.where(id: @apply ).all.order( 'created_at DESC' )
  
  end





  private
    # Use callbacks to share common setup or constraints between actions.
    def set_apply
      @apply = Apply.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def apply_params
      params.require(:apply).permit(:message, :user_id, :apartment_id)
    end
end
