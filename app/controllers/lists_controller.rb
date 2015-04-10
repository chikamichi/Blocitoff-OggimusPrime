class ListsController < ApplicationController
  # def index
  #   @lists = List.all
  #   authorize @list
  # end

  def new
    @list = List.new
    authorize @list
  end

  def create
    @user = User.find(params[:user_id])
    @list = current_user.lists.build(user: @user)
    # @list = List.new(params.require(:list).permit(:title, :description))
    authorize @list
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
