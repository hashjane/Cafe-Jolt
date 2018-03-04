class OrdersController < ApplicationController
  include CurrentTray
  before_action :set_tray, only: [:new, :create]
  before_action :ensure_tray_isnt_empty, only: :new
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    components = []
    @tray_items.map do |item| 
      com = []
      #com.push(item["_links"]["self"]["href"], item[:quantity])
      com = {
          "href": item["_links"]["self"]["href"],
          "quantity": item[:quantity]
        }
      components.push(com)
    end
    @order = Order.new(tray_id: @tray.id, components: components)
binding.pry
    respond_to do |format|
      if @order.save
        Tray.destroy(session[:tray_id])
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:tray_id, :components)
    end

    def ensure_tray_isnt_empty
      if @tray.line_items.empty?
        redirect_to menu_items_index_url, notice: 'Your tray is empty.'
      end
    end
end
