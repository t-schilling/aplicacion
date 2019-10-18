class ComentariorsController < ApplicationController
  before_action :find_restaurant
  before_action :find_comentarior, only: [:destroy, :edit, :update, :comentarior_owner]
  before_action :comentarior_owner, only:[:destroy, :edit, :update]
  def create
    @comentarior = @restaurant.comentariors.create(params[:comentarior].permit(:contenido, :valoracion))
    @comentarior.user_id = current_user.id
    #@comentarior.usernombre = current_user.nombre
    @comentarior.save
      respond_to do |format|
        if @comentarior.save
          format.html { redirect_to restaurant_path(@restaurant), notice: 'Comentario was successfully created.' }
          format.json { render :show, status: :created, location: @comentarior }
        else
          format.html { render :new }
          format.json { render json: @comentarior.errors, status: :unprocessable_entity }
        end
      end
  end

  def new
    @comentarior = Comentarior.new
  end

  def destroy
    @comentarior.destroy
    redirect_to restaurant_path(@restaurant)

  end

   def edit

   end

  def update
    if @comentarior.update(params[:comentarior].permit(:contenido, :valoracion))
      redirect_to restaurants_path(@restaurant)
    else
      render 'edit'
    end
  end

  private

  def find_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def find_comentarior
    @comentarior = @restaurant.comentariors.find(params[:id])
  end

  def comentarior_owner
    unless current_user.id == @comentarior.user_id
      flash[:notice] = "Accion no permitida"
      redirect_to restaurant_path(@restaurant)
    end
  end
end
