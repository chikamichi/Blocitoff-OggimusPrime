class ItemsController < ApplicationController
  # respond_to :html

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

  def destroy
    @list = List.find(params[:list_id])
    @item = @list.items.find(params[:id])

    authorize @item

    if @item.destroy
      flash[:notice] = "Task Completed."
      # redirect_to @list
    else
      flash[:error] = "Task couldn't be deleted. Try again."
    end

    respond_to do |format|
      format.html
      format.js 
    end
  end
end
