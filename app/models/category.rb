class Category < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_protected
  has_many :articles
end
