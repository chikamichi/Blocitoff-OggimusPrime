class ListsController < ApplicationController
  before_action :authenticate_user!

  def index
    @lists = current_user.lists
    authorize @lists
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
    authorize @list
  end

  def create
    @list = List.new(list_params)
    @list.user = current_user

    authorize @list
    if @list.save
      redirect_to @list, notice: "List was saved."
    else
      flash[:error] = "Error creating list. Please try again."
      render :new
    end
  end 

  def edit
  end

  def list_params
    params.require(:list).permit(:title, :description)
  end
end
