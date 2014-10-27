class Person < ActiveRecord::Base
  has_many :contributions
  has_many :articles, :through => :contributions
  
  validates :name,    presence: true
  validates :url,     presence: true
  validates :twitter, presence: true

  def slug
    name.downcase.gsub(/ /, "-")
  end

  def path
    "/people/#{slug}"
  end
end
