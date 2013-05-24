class PostsController < ApplicationController

  def index
  	@posts = Post.recents
  end

  def new
  	@post = Post.new
  end

  def show
    @post = Post.with_replies(params[:id])
    #@post = Post.find(params[:id])
    @reply = Reply.new
    @reply.user = current_user
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
      flash.now[:alert] = t("simple_form.error_notification.default_message")
  		render :new
  	end

  end

  def update
  	@post = Post.find(params[:id])

  	if @post.update_attributes(params[:post])
  		redirect_to posts_path, notice: 'Post atualizado com sucesso !'
  	else
  		render action: 'edit'
  	end

  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

end
