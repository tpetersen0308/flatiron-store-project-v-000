class Cart < ActiveRecord::Base
  has_many :line_items
  has_many :items, through: :line_items
  belongs_to :user

  def total
    self.items.map(&:price).reduce(:+)
  end

  def add_item(item_id)
    line_item = self.line_items.find_by(:item_id => item_id)
    if line_item
      quantity = line_item.quantity + 1
      line_item.update(:quantity => quantity)
      line_item
    else
      line_item = self.line_items.build(:item_id => item_id)
    end
  end

  def checkout
    self.line_items.each do |line_item|
      line_item.process
    end
    self.update(:status => "Submitted")
  end

  def submitted?
    self.status == "Submitted"
  end
end
