class RepliesController < ApplicationController

  def index
  	@replies = Reply.all
  end

  def new
  	@reply = Reply.new
  end

  def show
    @reply = Reply.find(params[:id])
  end

  def edit
  	@reply = Reply.find(params[:id])
  end

  def create
  	@reply = Reply.new(params[:reply])
    @reply.user = current_user
    @reply.post = Post.find(params[:post_id])

  	if @reply.save
  		redirect_to post_path(@reply.post), notice: t("flash.notice.reply_success")
  	else
  		redirect_to post_path(@reply.post), alert: t("flash.alert.empty_reply")
  	end

  end

  def update
  	@reply = Reply.new(params[:id])

  	if @reply.update_attributes(params[:reply])
  		redirect_to replies_path, notice: 'Resposta atualizada com sucesso !'
  	else
  		render action: 'edit'
  	end

  end

  def destroy
    @reply = Reply.find(params[:id])
    @reply.destroy
    redirect_to replies_path
  end

end