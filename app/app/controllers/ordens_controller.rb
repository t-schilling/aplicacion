class OrdensController < ApplicationController
  before_action :set_orden, only: [:show, :edit, :update, :destroy]
  before_action :find_restaurant

  # GET /ordens
  # GET /ordens.json
  def index
    @ordens = @restaurant.ordens
  end

  # GET /ordens/1
  # GET /ordens/1.json
  def show
  end

  # GET /ordens/new
  def new
    @orden = @restaurant.ordens.build
  end

  # GET /ordens/1/edit
  def edit
  end

  # POST /ordens
  # POST /ordens.json
  def create
    @orden = @restaurant.ordens.create(orden_params)
    @orden.user_id = current_user.id

    respond_to do |format|
      if @orden.save
        format.html { redirect_to restaurant_ordens_path(@restaurant), notice: 'Orden was successfully created.' }
        format.json { render :show, status: :created, location: @orden }
      else
        format.html { render :new }
        format.json { render json: @orden.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ordens/1
  # PATCH/PUT /ordens/1.json
  def update
    respond_to do |format|
      if @orden.update(orden_params)
        format.html { redirect_to restaurant_orden_path(@restaurant), notice: 'Orden was successfully updated.' }
        format.json { render :show, status: :ok, location: @orden }
      else
        format.html { render :edit }
        format.json { render json: @orden.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ordens/1
  # DELETE /ordens/1.json
  def destroy
    @orden.destroy
    respond_to do |format|
      format.html { redirect_to restaurant_ordens_path(@restaurant), notice: 'Orden was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_orden
      @orden = @restaurant.ordens.find(params[:id])
    end

  def find_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def orden_params
      params.require(:orden).permit(:nombreplato, :precio, :pago, :direccion, :llegada, :estado, :info)
    end
end
