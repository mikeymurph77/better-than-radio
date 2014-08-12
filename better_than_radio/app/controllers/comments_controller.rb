class CommentsController < ApplicationController
  def create
    commentable = find_commentable
    current_account.comments.create(comment_params.merge(commentable: commentable))
    concert = Concert.find_by(id: params[:concert_id])
    redirect_to concert
  end

  private

  def find_commentable
    find_concert
  end

  def find_concert
    Concert.find_by(id: params[:concert_id])
  end

  def comment_params
    params.require(:comment).permit(
      :body,
    )
  end
end
