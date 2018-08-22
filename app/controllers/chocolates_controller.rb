class ChocolatesController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
  before_action :set_chocolate, only: [:show, :edit, :update, :destroy]
  before_action :check_point, only: [:show]

  # GET /chocolates
  # GET /chocolates.json
  def index
    @chocolates = Chocolate.all
  end

  # GET /chocolates/1
  # GET /chocolates/1.json
  def show
  end

  # GET /chocolates/new
  def new
    @chocolate = Chocolate.new
  end

  # GET /chocolates/1/edit
  def edit
  end

  # POST /chocolates
  # POST /chocolates.json
  def create
    @chocolate = Chocolate.new(chocolate_params.merge(user_id: current_user.id))

    respond_to do |format|
      if @chocolate.save
        format.html { redirect_to @chocolate, notice: 'Chocolate was successfully created.' }
        format.json { render :show, status: :created, location: @chocolate }
      else
        format.html { render :new }
        format.json { render json: @chocolate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chocolates/1
  # PATCH/PUT /chocolates/1.json
  def update
    respond_to do |format|
      if @chocolate.update(chocolate_params)
        format.html { redirect_to @chocolate, notice: 'Chocolate was successfully updated.' }
        format.json { render :show, status: :ok, location: @chocolate }
      else
        format.html { render :edit }
        format.json { render json: @chocolate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chocolates/1
  # DELETE /chocolates/1.json
  def destroy
    @chocolate.destroy
    respond_to do |format|
      format.html { redirect_to chocolates_url, notice: 'Chocolate was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chocolate
      @chocolate = Chocolate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chocolate_params
      params.require(:chocolate).permit(:title, :content)
    end
    
    def check_point
      if current_user.points < 10
        redirect_back(fallback_location: root_path)
      end
    end
end
