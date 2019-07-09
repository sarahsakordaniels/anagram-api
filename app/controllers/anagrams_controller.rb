class AnagramsController < ApplicationController
  before_action :set_anagram, only: [:show, :update, :destroy]

  # GET /anagrams
  def index
    @anagrams = Anagram.all

    render json: @anagrams
  end

  # GET /anagrams/1
  def show
    render json: @anagram
  end

  # POST /anagrams
  def create
    @anagram = Anagram.new(anagram_params)

    if @anagram.save
      render json: @anagram, status: :created, location: @anagram
    else
      render json: @anagram.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /anagrams/1
  def update
    if @anagram.update(anagram_params)
      render json: @anagram
    else
      render json: @anagram.errors, status: :unprocessable_entity
    end
  end

  # DELETE /anagrams/1
  def destroy
    @anagram.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_anagram
      @anagram = Anagram.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def anagram_params
      params.fetch(:anagram, {})
    end
end
