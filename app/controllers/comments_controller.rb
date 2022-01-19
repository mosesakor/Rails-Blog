class CommentsController < ApplicationController
    def create
      @article = Article.find(params[:article_id])
      @comment = @article.comments.build(comment_params)
      p @comment
      if @comment.save
        redirect_to article_path(@article)
      else
        redirect_to article_path(@article)
      end
    end

    def destroy
      @article = Article.find(params[:article_id])
      @comment = @article.comments.find(params[:id])
      @comment.destroy
      redirect_to article_path(@article)
    end
  
    private
      def comment_params
        params.require(:comment).permit(:body, :user_id, :status)
      end
end
  