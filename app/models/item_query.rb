class ItemQuery
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  attr_accessor :keywords

  def initialize(attributes = nil)
    attributes ||= {}
    %w(keywords).each do |name|
      send("#{name}=", attributes[name])
    end
  end

  def persisted?
    false
  end

  def search(scope = Item)
    if keywords
      scope.where(build_condition)
    else
      scope
    end
  end

  private
  def build_condition
    keywords.split(" ").map{|kw|
      "%" + kw.strip.gsub(/!/, "!!").gsub(/%/, "!%").gsub(/_/, "!_") + "%"
    }.map{|pattern|
      "(title LIKE '#{pattern}' OR description LIKE '#{pattern}')"
    }.join(" AND ")
  end
end
