class CategoriesController < ApplicationController

  def index
  	@categories = Category.all
  end

  def new
  	@category = Category.new
  end

  def show
    @category = Category.find(params[:id])
    @posts = @category.posts
  end

  def edit
  	@category = Category.find(params[:id])
  end

  def create
  	@category = Category.new(params[:category])

  	if @category.save
  		redirect_to categories_path, notice: 'Categoria criada com suceso.'
  	else
  		redirect_to new_category_path, alert: 'Ocorreu um erro ao salvar a categoria.'
  	end

  end

  def update
  	@category = Category.new(params[:id])

  	if @category.update_attributes(params[:category])
  		redirect_to categories_path, notice: 'Categoria atualizada com sucesso !'
  	else
  		render action: 'edit'
  	end

  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path
  end

end