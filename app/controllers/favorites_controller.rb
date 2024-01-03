class FavoritesController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    favorite = current_user.favorites.new(book_id: book.id)
    if favorite.save
      respond_to do |format|
        format.html { redirect_to book_path(book), notice: 'Book added to favorites.' }
        format.js   # 追加：create.js.erbを呼び出す
      end
    else
      # エラー処理
    end
  end

  def destroy
    @book = Book.find(params[:book_id])
    favorite = current_user.favorites.find_by(book_id: @book.id)

    if favorite
      favorite.destroy
      respond_to do |format|
        format.html { redirect_to book_path(@book), notice: 'Book removed from favorites.' }
        format.js   # 追加：destroy.js.erbを呼び出す
      end
    else
      flash[:alert] = "Favorite not found."
      # エラー処理
    end
  end
end
