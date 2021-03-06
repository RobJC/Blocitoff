class ItemsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @item = current_user.items.build(items_params)
    @items = @user.items
    @new_item = Item.new
    
    if @item.save
      flash[:notice] = "Item was created."
    else
      flash[:error] = "There was an error saving the item.  Please try again."
    end
    
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def destroy
    @user = User.find(params[:user_id])
    @item = @user.items.find(params[:id])
    
    if @item.destroy
      flash[:notice] = "Item was removed."
    else
      flash[:error] = "Item couldn't be deleted. Try again."
    end
    
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  private
  
  def items_params
    params.require(:item).permit(:name)
  end
end
