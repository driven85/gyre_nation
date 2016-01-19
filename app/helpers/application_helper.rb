module ApplicationHelper

  def nav_elem name, path, current = false
    if current
      "<li class='current'>#{link_to( name, path )}</li>".html_safe
    else
      "<li>#{link_to( name, path )}</li>".html_safe
    end
  end

end
