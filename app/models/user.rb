class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :carts
  has_one :current_cart, -> {where(:status => "pending")}, class_name: "Cart"

  def build_cart
    self.carts.build
    self.save
    self.current_cart
  end

end
