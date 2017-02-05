class RecipiesController < ApplicationController
  before_action :set_recipy, only: [:show, :edit, :update, :destroy, :like, :dislike]
  skip_before_action :verify_authenticity_token
  devise_token_auth_group :member, contains: [:user, :admin]
  before_action :authenticate_member!

  # GET /recipies
  # GET /recipies.json
  def index
    @recipies = Recipy.paginate(paginate_params)
  end

  # GET /recipies/1
  # GET /recipies/1.json
  def show
  end

  # GET /recipies/new
  def new
    @recipy = Recipy.new
    @recipy.steps.build
  end

  # GET /recipies/1/edit
  def edit
  end

  # POST /recipies
  # POST /recipies.json
  def create
    @recipy = Recipy.new(recipy_params)

    params[:recipy][:ingredients].each do |e|
      @ingredient = Ingredient.find_by name: e
      if @ingredient.nil?
        render json: {status: 'Ingredient not found'}, status: :unprocessable_entity
        return
      else
        @recipy.ingredients << @ingredient
      end
    end

    params[:recipy][:categories].each do |e|
      @category = Category.find_by name: e
      if @category.nil?
        render json: {status: 'Category not found'}, status: :unprocessable_entity
        return
      else
        @recipy.categories << @category
      end
    end

    @recipy.user = current_user || current_admin

    if @recipy.save
      render :show, status: :ok, location: @recipy
    else
      render json: @recipy.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /recipies/1
  # PATCH/PUT /recipies/1.json
  def update
    if @recipy.update(recipy_params)
      render :show, status: :ok, location: @recipy
    else
      render json: @recipy.errors, status: :unprocessable_entity
    end
  end

  # DELETE /recipies/1
  # DELETE /recipies/1.json
  def destroy
    @recipy.cookbooks.each { |cookbook| cookbook.recipies -= [@recipy] }
    @recipy.destroy
    head :no_content
  end

  def like
    unless current_user.cookbook.recipies.include?(@recipy)
      current_user.cookbook.recipies << @recipy
      @recipy.increment!(:likes_count)
      render json: {status: 'ok'}, status: 200
    else
      render json: {status: 'unprocessable_entity'}, status: :unprocessable_entity
    end
  end

  def dislike
    if current_user.cookbook.recipies.include?(@recipy)
      current_user.cookbook.recipies -= [@recipy]
      @recipy.decrement!(:likes_count)
      render json: {status: 'ok'}, status: 200
    else
      render json: {status: 'unprocessable_entity'}, status: :unprocessable_entity
    end
  end

  def search
    @recipies = Recipy.search(params[:search])
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_recipy
    @recipy = Recipy.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def recipy_params
    params.require(:recipy).permit(:name, :description, :main_photo, :cook_time, :calories, :proteins,
                                   :fats, :carbohydrates, steps_attributes: [:name, :description, :image])
  end
end
