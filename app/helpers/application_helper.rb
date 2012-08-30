module ApplicationHelper
  def flash_message
    html = ''
    flash.each do |k, m|
      html = "<p class=\"#{k}-message\">#{m}</p>"
    end
    html.html_safe
  end
end