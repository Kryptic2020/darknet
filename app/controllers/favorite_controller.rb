class FavoriteController < ApplicationController
before_action :authenticate_user!
  def index
    @favorites = Favorite.where(user_id:current_user.id)  
  end

  def update
  end

  def destroy
    product_id = params[:id]
    deleted = Favorite.destroy_by(product_id:product_id)
    redirect_to favorite_index_path
  end
end
