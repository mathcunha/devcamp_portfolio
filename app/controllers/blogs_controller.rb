class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy, :toggle_status]
  layout "blog"
  load_and_authorize_resource

  # GET /blogs
  # GET /blogs.json
  def index
    @blogs = Blog.all.includes(:topic).order(:title).page params[:page]
    @topics = Topic.limit(12)
  end

  # GET /blogs/1
  # GET /blogs/1.json
  def show
    @blogs = Blog.limit(4).includes(:topic).order(:title)
    @topics = Topic.limit(12)
  end

  # GET /blogs/topic
  # GET /blogs/topic.json
  def topic
    @blogs = Blog.joins(:topic).where('topics.title' => params[:title]).page params[:page]
    @topics = Topic.limit(12)
    respond_to do |format|
      format.html { render :index }
      format.json { render :index, status: :ok, location: @blogs }
    end
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
  end

  # GET /blogs/1/edit
  def edit
    @blogs = Blog.limit(4).includes(:topic).order(:title)
    @topics = Topic.limit(12)
  end

  # POST /blogs
  # POST /blogs.json
  def create
    @blog = Blog.new(blog_params)

    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog, notice: 'Blog was successfully created.' }
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blogs/1
  # PATCH/PUT /blogs/1.json
  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: 'Blog was successfully updated.' }
        format.json { render :show, status: :ok, location: @blog }
      else
        @blogs = Blog.limit(4).includes(:topic).order(:title)
        @topics = Topic.limit(12)
        format.html { render :edit }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blogs/1/toggle_status
  # PATCH/PUT /blogs/1.json/toggle_status
  def toggle_status
    respond_to do |format|
      puts ()
      if @blog.update(status: @blog.draft? ? 'published' : 'draft')
        format.html { redirect_to blogs_url, notice: 'Blog status was successfully updated.' }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: 'Blog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blog_params
      params.require(:blog).permit(:title, :body)
    end
end
