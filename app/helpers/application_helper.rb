module ApplicationHelper
  def br(text)
    return unless text
    text.split("\n").map{|line|
      h(line)
    }.join("<br>").html_safe
  end
end
