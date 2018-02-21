class TraysController < ApplicationController
  before_action :set_tray, only: [:show, :edit, :update, :destroy]

  # GET /trays
  # GET /trays.json
  def index
    @trays = Tray.all
  end

  # GET /trays/1
  # GET /trays/1.json
  def show
    #@menu_item = MenuItem.get_menu_item_by_id('/menu_items/21f55aa5-9785-4f74-b625-2217139d3fc4')
    logger.debug "THIS ++++> #{@tray.line_items}"
    @tray.line_items.each do |item|
      @menu_item = MenuItem.get_menu_item_by_id(item[:menu_item_id]);
    end
  end

  # GET /trays/new
  def new
    @tray = Tray.new
  end

  # GET /trays/1/edit
  def edit
  end

  # POST /trays
  # POST /trays.json
  def create
    @tray = Tray.new(tray_params)

    respond_to do |format|
      if @tray.save
        format.html { redirect_to @tray, notice: 'Tray was successfully created.' }
        format.json { render :show, status: :created, location: @tray }
      else
        format.html { render :new }
        format.json { render json: @tray.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trays/1
  # PATCH/PUT /trays/1.json
  def update
    respond_to do |format|
      if @tray.update(tray_params)
        format.html { redirect_to @tray, notice: 'Tray was successfully updated.' }
        format.json { render :show, status: :ok, location: @tray }
      else
        format.html { render :edit }
        format.json { render json: @tray.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trays/1
  # DELETE /trays/1.json
  def destroy
    @tray.destroy
    respond_to do |format|
      format.html { redirect_to trays_url, notice: 'Tray was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tray
      @tray = Tray.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tray_params
      params.fetch(:tray, {})
    end
end
