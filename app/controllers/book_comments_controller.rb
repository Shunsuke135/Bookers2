class BookCommentsController < ApplicationController
    before_action :authenticate_user!
    before_action :comment_correct_user, only: [:destroy]

    def create
      @book = Book.find(params[:book_id])
      @comment = current_user.book_comments.new(comment_params)
      @comment.book_id = @book.id
      @comment.save
    end

    def destroy
      @book = Book.find(params[:id])
      comment = BookComment.find(params[:book_id])
      comment.destroy
    end

    private

    def comment_params
      params.require(:book_comment).permit(:user_id, :book_id, :comment)
    end

    def comment_correct_user
      comment = BookComment.find(params[:book_id])
        if comment.user_id != current_user.id
          redirect_to user_path(current_user)
        end
    end
end
