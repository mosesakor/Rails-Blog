class CommentsController < ApplicationController
    def show

    end
    
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

    def edit
      @comment = Comment.find(params[:id])
      @article = Article.find(params[:article_id])
    end
  

    def update
      @comment = Comment.find_by_id(params[:id])
      @comment.update(comment_params)
      flash[:notice] = "Comment updated."
      redirect_to '/articles'
    end

    def destroy
      @article = Article.find(params[:article_id])
      @comment = @article.comments.find(params[:id])
      @comment.destroy
      redirect_to article_path(@article)
    end
  
    private
      def user
        current_user
      end

      def comment_params
        params.require(:comment).permit(:body, :user_id, :status)
      end
end
  