class CommentsController < AuthenticatedController
  def create
    @project = Project.find(params[:project_id])
    @comment = current_user.comments.new(project: @project, **params.require(:comment).permit(:body))
    if @comment.save
      redirect_to @project, notice: "Your comment has been posted"
    else
      render @project, status: :unprocessable_entity
    end
  end
end
