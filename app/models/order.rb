class Order < ApplicationRecord
  belongs_to :tray
  before_save :set_order_uuid

  def set_order_uuid
    self.id = SecureRandom.uuid
  end
end
