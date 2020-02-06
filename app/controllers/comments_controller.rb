class CommentsController < ApplicationController
  load_and_authorize_resource
  
  def create
    @comment = current_user.comments.build(comment_params)    
    respond_to do |format|
      if @comment.save
        format.json { render json: @comment, status: :ok}
      else
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end    
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:content, :blog_id)
    end
end
