class DucksController < ApplicationController

  before_action :find_duck, only: [:show, :edit, :destroy, :update]

  def new
    @duck = Duck.new
    @student = Student.all
  end

  def create
    @duck = Duck.create(duck_params)
    if @duck.valid?
      redirect_to @duck
    else
      flash[:errors] = @duck.errors.full_messages
      redirect_to new_duck_path
    end
  end

  def index
    @ducks = Duck.all
  end

  def show

  end

  def edit
    @student = Student.all
  end

  def update
    @duck.update(duck_params)
    if @duck.valid?
      redirect_to @duck
    else
      flash[:errors] = @duck.errors.full_messages
      redirect_to edit_duck_path
    end
  end

  def destroy
    @duck.destroy
    redirect_to ducks_path
  end
  private

  def find_duck
    @duck = Duck.find(params[:id])
  end

  def duck_params
    params.require(:duck).permit(:name, :description)
  end
end
