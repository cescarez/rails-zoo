class AnimalsController < ApplicationController
  def index
    @animals = Animal.all
  end

  def new
    @animal = Animal.new
  end

  def create
    @animal = Animal.new(animal_params)

    if @animal.nil?
      render file: "#{Rails.root}/public/404.html" , status: :not_found
      return
    elsif @animal.save
      redirect_to animal_path(@animal.id)
      return
    else
      render :new
      return
    end
  end

  def show
    @animal = Animal.find_by(id: params[:id])

    if @animal.nil?
      render file: "#{Rails.root}/public/404.html" , status: :not_found
      return
    else
      redirect_to animal_path(@animal.id)
      return
    end
  end

  def edit
    @animal = Animal.find_by(id: params[:id])

    if @animal.nil?
      render file: "#{Rails.root}/public/404.html" , status: :not_found
      return
    else
      render :new
      return
    end
  end

  def update
    @animal = Animal.find_by(id: params[:id])

    if @animal.nil?
      render file: "#{Rails.root}/public/404.html" , status: :not_found
      return
    elsif @animal.update(animal_params)
      redirect_to animal_path(@animal.id)
      return
    else
      render :new
      return
    end
  end

  def destroy
    @animal = Animal.find_by(id: params[:id])

    if @animal.nil?
      render file: "#{Rails.root}/public/404.html" , status: :not_found
      return
    elsif @animal.destroy
      redirect_to animals_path
      return
    else
      redirect_to animal_path(@animal.id)
      return
    end
  end

  private

  def animal_params
    return params.require(:animal).permit(:name, :species, :age)
  end

end
