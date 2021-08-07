class FavoriteController < ApplicationController
before_action :authenticate_user!

  # Send @favorites to HTML - favorite_index GET    /favorite/index
  def index
    @favorites = Favorite.where(user_id:current_user.id)  
  end

  # Delete favorite - favorite_destroy DELETE /favorite/destroy/:id
  def destroy
    deleted = Favorite.destroy_by(product_id:params[:id])
    redirect_to favorite_index_path
  end
end
