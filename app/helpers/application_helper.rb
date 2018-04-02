module ApplicationHelper

  def logged_in?
    current_user ? true : false
  end

  def nav_header
    nav_html = content_tag(:li, link_to("Store Home", store_path))
    if logged_in?
      if !!@cart
        nav_html += content_tag(:li, link_to("Cart", cart_path(current_user.current_cart)))
      end
      nav_html += content_tag(:li, link_to("Sign out", destroy_user_session_path, method: 'delete'))
    else
      nav_html += (content_tag(:li, link_to("Sign up", new_user_registration_path)) +
      content_tag(:li, link_to("sign in", new_user_session_path)))
    end
  end

end
