class ItemsController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @item = Item.new
    authorize @item
  end

  def create
    @list = List.find(params[:list_id])
    @item = Item.new(params.require(:item).permit(:name))
    @item.list = @list

    authorize @item
    if @item.save
      redirect_to @list, notice: "Item added to list."
    else
      flash[:error] = "Error creating item. Please try again."
      render :new
    end
  end
end
