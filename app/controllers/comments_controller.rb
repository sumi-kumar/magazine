class CommentsController < ApplicationController

	def index
		@commentable = comment_params
		@comments = @commentable.comments
	end

	def show
	end

  def new
  	@comment = Comment.new
  end

  def edit
  end

  def create
    @parent = Article.find(params[:article_id]) if params[:article_id]
  	@parent = Comment.find(params[:comment_id]) if params[:comment_id]
  	@comment = @parent.comments.build(comment_params)
  	@comment.user = current_user
  	if @comment.save
  		flash[:notice] = "successfully created comment"
  		redirect_to :back
  	else 
  		render 'new'
  	end
  end

  def update
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.present?
      @comment.destroy
      flash[:success] = "comment deleted succcefully"
    end
    redirect_to root_url
  end

 private

  def comment_params
    params.require(:comment).permit(:body)
  end
end

