class BookCommentsController < ApplicationController
  
 
  def create
    @book = Book.find(params[:book_id])
    comment = current_user.book_comments.new(book_comment_params)
    comment.book_id = @book.id
    if comment.save
      
    #非同期通信化実装の為、redirect無し
    else
      #コメントのバリデーションの設定
      @book_comment = comment
      @user = @book.user
      @newbook = Book.new
      render "books/show" 
    end
  end
  
  def destroy
    @book = Book.find(params[:book_id])
    BookComment.find(params[:id]).destroy
     #非同期通信化実装の為、redirect無し
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

end
  

