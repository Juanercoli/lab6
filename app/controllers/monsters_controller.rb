class MonstersController < ApplicationController
  def index
    @monsters = Monster.all.order(id: :desc)
  end

  def show
    monster
  end

  # Se usa para renderizar el form y usar una instancia vacia del record
  def new
    @monster = Monster.new
  end

  # Se usa para crear un record
  def create
    @monster = Monster.new(monster_params)

    if @monster.save
      redirect_to edit_monster_path(@monster), notice: "Monstruo creado"
    else
      render :new, status: :unprocessable_entity
    end
  end

  # Se renderiza el form de edit
  def edit
    monster
  end

  # Se actualiza el monstruo
  def update
    monster
    if monster.update(monster_params)
      redirect_to monsters_path, notice: "Monstruo editado"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def monster_params
    params.require(:monster).permit(:name, :description, :phone, :birthdate)
  end

  def monster
    # Si esta seteado no hace nada sino lo va a buscar
    @monster ||= Monster.find(params[:id])
  end
end
