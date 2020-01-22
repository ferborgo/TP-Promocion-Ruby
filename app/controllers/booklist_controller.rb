class BooklistController < ApplicationController

  before_action :set_book, only: [:addBook, :removeBook, :updateStatus]
  before_action :authenticate_user!
  before_action :set_user, only: [:index]

  def index
    @statuses = BookUser.statuses
    @books = BookUser.where(user: @user).page params[:page]
  end

  def addBook
    if current_user.books.include?(@book)
      @message = 'The book already is in your Booklist'
    else
      current_user.books << @book
      @message = 'The book has been added to your Booklist'
    end
    respond_to do |format|
      format.html { redirect_to booklist_path(user_id: current_user.id), notice: @message }
    end
  end

  def removeBook
    if current_user.books.include?(@book)
      current_user.books.delete(@book)
      @message = 'The book has been deleted from your Booklist'
    else
      @message = 'The book is not in your Booklist'
    end
    respond_to do |format|
      format.html { redirect_to booklist_path(user_id: current_user.id), error: @message }
    end
  end

  def updateStatus
    if current_user.books.include?(@book)
      bookBooklist = BookUser.find_by(user:current_user, book:@book)
      bookBooklist.status = params[:status_id]
      bookBooklist.save
      @message = 'Status has been updated'
    else
      @message = 'The book is not in your Booklist'
    end
    respond_to do |format|
      format.html { redirect_to booklist_path(user_id: current_user.id), notice: @message }
    end
  end

  private
  def set_book
    @book = Book.find(params[:id])
  end

  def set_user
    if params[:user_id].nil?
      id = current_user.id
    else
      id = params[:user_id]
    end
    @user = User.find(id)
  end

end
