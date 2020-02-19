class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  helper_method :has_commented?
  # GET /books
  # GET /books.json
  def index
    @books = Book.all
  end

  # GET /books/1
  # GET /books/1.json
  def show
    @count_recommendations = Recommendation.where(book: @book).count
    @have_recommended = Recommendation.exists?(book: @book, user: current_user)
    @average = (@book.opinions.sum {|opinion| opinion.stars} / @book.opinions.count.to_f).round(2)
  end

  # GET /books/new
  def new
    @authors = Author.all
    @book = Book.new
    @genres = Genre.all
  end

  # GET /books/1/edit
  def edit
    @authors = Author.all
    @genres = Genre.all
  end

  # POST /books
  # POST /books.json
  def create
    params.permit!
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        @authors = Author.all
        @book = Book.new
        @genres = Genre.all
        logger.debug('ERRORS: ' + @book.errors.to_s)
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:title, :pages, :published_at, :author_id, :genre_id)
    end

    def has_commented?
      @book.opinions.exists?(user: current_user)
    end
end
