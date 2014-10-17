class Person < ActiveRecord::Base
  validates :name,    presence: true
  validates :url,     presence: true
  validates :twitter, presence: true

  def slug
    name.downcase.gsub(/ /, "-")
  end
end
