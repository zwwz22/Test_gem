module ApplicationHelper

  #
  def categories
    Category.all
  end

  def recent_articles
    Article.order('created_at desc').limit 4
  end
end
