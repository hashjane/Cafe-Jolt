module CurrentTray

  private

    def set_tray
      @tray = Tray.find(session[:tray_id])
    rescue ActiveRecord::RecordNotFound
      @tray = Tray.create
      session[:tray_id] = @tray.id
    ensure
      @tray_items = MenuItem.get_menu_items_by_tray(@tray.line_items)
    end
end
