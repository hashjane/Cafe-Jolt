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
    menu_item = MenuItem.get_menu_item_by_id(params[:item_id])
    @line_item = @tray.add_menu_item(menu_item)

    #@line_item = @tray.line_items.build(menu_item_id: menu_item['_links']['self']['href'])

    respond_to do |format|
      if @line_item.save
        format.html { redirect_to menu_items_index_url }
#        format.js
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
      if @line_item.update(quantity: @line_item.quantity-1  )
        self.destroy if @line_item.quantity == 0
        format.html { redirect_to menu_items_index_url, notice: 'Your tray has been updated.' }
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
