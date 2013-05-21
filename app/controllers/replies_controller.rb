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

  	if @post.save
  		redirect_to show_post_path, notice: 'Resposta criada com suceso.'
  	else
  		redirect_to new_reply_path, alert: 'Ocorreu um erro ao salvar a resposta.'
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