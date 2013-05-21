class PostsController < ApplicationController

  before_filter :authenticate_user!

  def index
  	@posts = Post.all
  end

  def new
  	@post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
  	@post = Post.find(params[:id])
  end

  def create
  	@post = Post.new(params[:post])

    @post.user = current_user

  	if @post.save
  		redirect_to posts_path, notice: 'Post criado com suceso.'
  	else
  		redirect_to new_post_path, alert: 'Ocorreu um erro ao salvar o post.'
  	end

  end

  def update
  	@post = Post.find(params[:id])

  	if @post.update_attributes(params[:post])
  		redirect_to posts_path, notice: 'Post atualizado com sucesso !'
  	else
      asd
  		render action: 'edit'
  	end

  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

end