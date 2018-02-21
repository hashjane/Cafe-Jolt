class LineItemsController < ApplicationController
  include CurrentTray
  before_action :set_tray, only: [:create]
  before_action :set_line_item, only: [:show, :edit, :update, :destroy]

  # GET /line_items
  # GET /line_items.json
  def index
    @line_items = LineItem.all
  end

  # GET /line_items/1
  # GET /line_items/1.json
  def show
  end

  # GET /line_items/new
  def new
    @line_item = LineItem.new
  end

  # GET /line_items/1/edit
  def edit
  end

  # POST /line_items
  # POST /line_items.json
  def create
    menu_item = MenuItem.get_menu_item_by_id('/menu_items/21f55aa5-9785-4f74-b625-2217139d3fc4')
    #pp menu_item.inspect
    #@line_item = @tray.line_items.build(menu_item_id: '21f55aa5-9785-4f74-b625-2217139d3fc4')
    @line_item = @tray.line_items.build(menu_item_id: menu_item['_links']['self']['href'])
    logger.debug "hash this  #{menu_item['_links']['self']['href'].inspect}"
    logger.debug "LINEITEMs  #{@line_item.inspect}"

    respond_to do |format|
      if @line_item.save
        format.html { redirect_to @line_item.tray, notice: 'Line item was successfully created.' }
        format.json { render :show, status: :created, location: @line_item }
      else
        format.html { render :new }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /line_items/1
  # PATCH/PUT /line_items/1.json
  def update
    respond_to do |format|
      if @line_item.update(line_item_params)
        format.html { redirect_to @line_item, notice: 'Line item was successfully updated.' }
        format.json { render :show, status: :ok, location: @line_item }
      else
        format.html { render :edit }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
    @line_item.destroy
    respond_to do |format|
      format.html { redirect_to line_items_url, notice: 'Line item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_item_params
      params.require(:line_item).permit(:menu_item_id, :tray_id)
    end
end
