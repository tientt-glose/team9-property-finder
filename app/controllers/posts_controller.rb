class PostsController < ApplicationController
  before_action :authenticate_account!, only: [:new,:create]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :can_access?, except: [:show, :latest]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  def latest
    @posts = Post.active
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /posts/1
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    def can_access?
      @show_sidebar = true

      unless current_account.admin?
          redirect_to root_url, flash: { danger: "You are not admin"}
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(
        :title, :url, :summary, :body, :image,:active, :image_cache
      )
    end
end
