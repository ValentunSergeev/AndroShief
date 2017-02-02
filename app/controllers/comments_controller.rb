class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  devise_token_auth_group :member, contains: [:user, :admin]
  before_action :authenticate_member!

  def index
    @recipy = Recipy.find(params[:recipy_id])
    @comments = @recipy.comments.paginate(paginate_params)
  end

  def show
  end

  def new
    @comment = Comment.new
  end

  def edit
  end

  def create
    @recipy = Recipy.find(params[:recipy_id])
    @comment = @recipy.comments.create(comment_params)
    @comment.user = current_user || current_admin
    if @comment.save
      render "recipies/show"
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def update
    if @comment.update(ingredient_params)
      render :show, status: :ok, location: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @comment.destroy
    format.json  head :no_content
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params
    params.require(:comment).permit(:body)
  end
end
