class CommentsController < ApplicationController
  def create
    commentable = find_commentable
    current_account.comments.create(comment_params.merge(commentable: commentable))
    redirect_to commentable
  end

  private

  def find_commentable
    find_concert || find_photo
  end

  def find_concert
    Concert.find_by(id: params[:concert_id])
  end

  def find_photo
    Photo.find_by(id: params[:photo_id])
  end

  def comment_params
    params.require(:comment).permit(
      :body,
    )
  end
end
