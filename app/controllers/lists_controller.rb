class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(params.require(:list).permit(:title, :description))
    if @list.save
      redirect_to @list, notice: "List was created."
    else
      flash[:error] = "Error creating list. Please try again."
      render :new
    end
  end

  def show
  end

  def edit
  end
end
