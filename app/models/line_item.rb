class LineItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :item

  def process
    self.item.inventory -= self.quantity
    self.item.save
    self.destroy
  end
end
