module CartsHelper

  def current_cart
    current_user.current_cart
  end

  def number_to_currency(n)
    n.to_s.split('').insert(-3, '.').join.prepend('$')
  end
end