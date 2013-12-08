class CesController < ApplicationController
  before_action :set_ce, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, only: [:index, :new, :show, :edit, :update, :destroy]
  # GET /ces
  # GET /ces.json
  def index
    @ces = Ce.all
  end

  # GET /ces/1
  # GET /ces/1.json
  def show
  end

  # GET /ces/new
  def new
    @ce = current_user.ces.build
  end

  # GET /ces/1/edit
  def edit
  end

  # POST /ces
  # POST /ces.json
  def create
    @ce = current_user.ces.build(ce_params)

    respond_to do |format|
      if @ce.save
        format.html { redirect_to @ce, notice: 'Ce was successfully created.' }
        format.json { render action: 'show', status: :created, location: @ce }
      else
        format.html { render action: 'new' }
        format.json { render json: @ce.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ces/1
  # PATCH/PUT /ces/1.json
  def update
    respond_to do |format|
      if @ce.update(ce_params)
        format.html { redirect_to @ce, notice: 'Ce was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @ce.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ces/1
  # DELETE /ces/1.json
  def destroy
    @ce.destroy
    respond_to do |format|
      format.html { redirect_to ces_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ce
      @ce = Ce.find(params[:id])
    end

    def correct_user
      @ce = current_user.ces.find_by(id: params[:id])
      redirect_to ces_path, notice: "Not authorized to edit this CE" if @ce.nil?
    end  
      
    # Never trust parameters from the scary internet, only allow the white list through.
    def ce_params
      params.require(:ce).permit(:title, :hours, :cert)
    end
end
