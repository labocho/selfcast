module ApplicationHelper
  def br(text)
    return unless text
    text.split("\n").map{|line|
      h(line)
    }.join("<br>").html_safe
  end

  def icon(name, size = nil)
    # large, 2x, 3x, 4x are available for size
    size = "icon-#{size}" if size
    content_tag("i", "", class: ["icon-#{name}", size].compact) + " ".html_safe
  end
end
