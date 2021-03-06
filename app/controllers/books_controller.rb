class BooksController < ApplicationController
	before_action :authenticate_user!

  def show
	  @book = Book.find(params[:id])
	  @comment =Comment.new
  end

  def index
  	@book = Book.new 
	@books = Book.all
	@book.tags.build  
  end

  def create
  	@book = Book.new(book_params) 
	  @book.user_id = current_user.id
  	if @book.save
  		redirect_to @book, notice: "successfully created book!"
  	else
  		@books = Book.all
  		render 'index'
  	end
  end

  def edit
  	@book = Book.find(params[:id])
  end

  def update
  	@book = Book.find(params[:id])
  	if @book.update(book_params)
  		redirect_to @book, notice: "successfully updated book!"
  	else #if文でエラー発生時と正常時のリンク先を枝分かれにしている。
  		render "edit"
  	end
  end

  def destroy
  	@book = Book.find(params[:id])
  	@book.destroy
  	redirect_to books_path, notice: "successfully delete book!"
  end

  private

  def book_params
  	params.require(:book).permit(:title, :body, tags_atrributes: [:tag_id, :genre])
  end

end