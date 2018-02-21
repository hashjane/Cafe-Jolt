module CurrentTray

  private

    def set_tray
      @tray = Tray.find(session[:tray_id])
    rescue ActiveRecord::RecordNotFound
      @tray = Tray.create
      session[:tray_id] = @tray.id
    end
end
