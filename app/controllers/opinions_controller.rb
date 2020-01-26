class OpinionsController < ApplicationController
  before_action :set_opinion, only: [:show, :edit, :update, :destroy]

  # GET /opinions
  # GET /opinions.json
  def index
    @opinions = Opinion.all
  end

  # GET /opinions/1
  # GET /opinions/1.json
  def show
  end

  # GET /opinions/new
  def new
    @opinion = Opinion.new
  end

  # GET /opinions/1/edit
  def edit
  end

  # POST /opinions
  # POST /opinions.json
  def create
    @opinion = Opinion.new
    @opinion.text = params[:text]
    @opinion.stars = params[:stars]
    @opinion.user = current_user
    @opinion.book = Book.find(params[:book_id])
    @opinion.save
    redirect_to book_path(@opinion.book.id)
  end

  # PATCH/PUT /opinions/1
  # PATCH/PUT /opinions/1.json
  def update
    respond_to do |format|
      if @opinion.update(opinion_params)
        format.html { redirect_to @opinion, notice: 'Opinion was successfully updated.' }
        format.json { render :show, status: :ok, location: @opinion }
      else
        format.html { render :edit }
        format.json { render json: @opinion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /opinions/1
  # DELETE /opinions/1.json
  def destroy
    if @opinion.user === current_user
      @opinion.destroy
      respond_to do |format|
        format.html { redirect_to book_path(@opinion.book.id), notice: 'Opinion was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to opinions_url, error: 'Only owner of the opinion can destroy it' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_opinion
      @opinion = Opinion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def opinion_params
      params.fetch(:opinion, {}).permit(:text, :stars, :book_id, :user_id)
    end
end
