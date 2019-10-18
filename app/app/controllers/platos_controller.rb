class PlatosController < ApplicationController
  before_action :find_restaurant
  before_action :set_plato, only: [:show, :edit, :update, :destroy]

  # GET /platos
  # GET /platos.json
  def index
    @platos = @restaurant.platos
  end

  # GET /platos/1
  # GET /platos/1.json
  def show
    @plato =Plato.find(params[:id])
  end

  # GET /platos/new
  def new
    @plato = @restaurant.platos.build
  end

  # GET /platos/1/edit
  def edit
  end

  # POST /platos
  # POST /platos.json
  def create
    #@restaurant = Restaurant.find(params[:restaurant_id])
    @plato = @restaurant.platos.create(plato_params)

    respond_to do |format|
      if @plato.save
        format.html { redirect_to restaurant_platos_path(@restaurant), notice: 'Plato was successfully created.' }
        format.json { render :show, status: :created, location: @plato }
      else
        format.html { render :new }
        format.json { render json: @plato.errors, status: :unprocessable_entity }
      end
    end
    end

  # PATCH/PUT /platos/1
  # PATCH/PUT /platos/1.json
  def update
    respond_to do |format|
      if @plato.update(plato_params)
        format.html { redirect_to restaurant_platos_path(@restaurant), notice: 'Plato was successfully updated.' }
        format.json { render :show, status: :ok, location: @plato }
      else
        format.html { render :edit }
        format.json { render json: @plato.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /platos/1
  # DELETE /platos/1.json
  def destroy
    @plato.destroy
    respond_to do |format|
      format.html { redirect_to restaurant_platos_path(@restaurant), notice: 'Plato was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

    private
  # Use callbacks to share common setup or constraints between actions.
    def set_plato
      @plato = @restaurant.platos.find(params[:id])
    end

   def find_restaurant
     @restaurant = Restaurant.find(params[:restaurant_id])
   end
  # Never trust parameters from the scary internet, only allow the white list through.
    def plato_params
      params.require(:plato).permit(:nombre, :precio, :descripcion, :cantidad_personas, :imagen, :valoracion)
    end
  end
