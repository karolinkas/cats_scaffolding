class CatsController < ApplicationController
  
 before_filter :assign_cat, only: [:show, :destroy]


  def index

  	@cats = Cat.all

  end

  def search

		search_term = params[:name]

  if search_term == '' || search_term.nil?
  	@cats =[]
  else
		@cats = Cat.where(['name LIKE ?', "%#{search_term}%"])
	end

  end

  def new

  	@cat = Cat.new 

  end


  def edit

  	@cat = Cat.find(params[:id])

  end

  def create

  	@cat = Cat.new(cat_params)

  	if @cat.save
  		redirect_to cats_url
  	else
  		render :new
  	end

  end

  def show
  	
  end

  def destroy
  	
  	@cat.destroy
		redirect_to cats_url

  end

  private

  def cat_params
  	params.require(:cat).permit(:name, :birthday)
  end


  def assign_cat
  	@cat = Cat.find(params[:id])
  end

end
