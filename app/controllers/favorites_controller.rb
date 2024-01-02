class FavoritesController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    favorite = current_user.favorites.new(book_id: book.id)
    favorite.save
  end

  def destroy
    @book = Book.find(params[:book_id])
    favorite = current_user.favorites.find_by(book_id: @book.id)

    # favorite が存在するか確認してから destroy メソッドを呼ぶ
    if favorite
      favorite.destroy
    else
      # おそらくエラーメッセージを設定するか、何か他の処理を行う
      flash[:alert] = "Favorite not found."
    end
  end
end
