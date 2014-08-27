class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def create
    @entry = Entry.find(params[:entry_id])
    @comment = Comment.new(comment_params)
    @blog = Blog.find(@entry.blog_id)
    
    respond_to do |format|
      if @comment.save
        format.html { 
          redirect_to blog_entry_path(@entry.blog_id, @entry.id), notice: 'Comment was successfully created.' 
          send_mail @blog, @entry, @comment
          }
      else
        format.html { redirect_to blog_entry_path(@entry), error: 'Comment was not successfully created.'  }
      end
    end
  end

  def send_mail(blog, entry, comment)
#     user = User.find(1)

    @mail = NoticeMailer.sendmail_confirm(blog, entry, comment).deliver
#     render :text => "送信できた！"
  end
  
  def approve
    respond_to do |format|
      @comment = Comment.find(params[:id])
      @comment.status = 'approved'
      @entry = Entry.find(@comment.entry_id)
      if @comment.save()
        format.html { redirect_to blog_entry_path(@entry.blog_id, @entry.id), notice: 'Comment was successfully approved.' }
      else
        format.html { redirect_to blog_entry_path(@entry.blog_id, @entry.id), notice: 'Comment was not successfully approved.' }
      end
    end
  end

  def destroy
    @entry = Entry.find(@comment.entry_id)
    @blog = Blog.find(@entry.blog_id)
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to blog_entry_path(@blog, @entry), notice: 'Comment was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:entry_id, :body, :status)
    end
end
