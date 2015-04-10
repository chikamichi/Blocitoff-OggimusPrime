class ListsController < ApplicationController
  # def index
  #   @lists = List.all
  #   authorize @list
  # end
  before_action :authenticate_user!

  def new
    @list = List.new
    authorize @list
  end

  def create
    @list = List.new(params[:id])
    @list.user = current_user

    authorize @list
    if @list.save
      redirect_to list_path(@list), notice: "List was saved."
    else
      flash[:error] = "Error creating list. Please try again."
      render :new
    end
  end 

  def show
  end

  def edit
  end

  def list_params
    params.require(:list).permit(:title, :description)
  end
end
