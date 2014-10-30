class Contributor < ActiveRecord::Base
  has_many :contributions
  has_many :articles, :through => :contributions

  validates :name,    presence: true
  validates :url,     presence: true
  validates :twitter, presence: true

  before_create :set_slug
  before_update :set_slug

  def path
    "/contributors/#{slug}"
  end

  private

  def set_slug
    blank     = ""
    separator = "-"

    self.slug = name
    self.slug = slug.downcase.
      gsub(/\(|\)|\[|\]\./, blank).
      gsub(/&amp;/,         blank).
      gsub(/\W+/,           separator).
      gsub(/_+/,            separator).
      gsub(/ +/,            separator).
      gsub(/-+/,            separator).
      gsub(/^-+/,           blank).
      gsub(/-+$/,           blank)
  end
end
