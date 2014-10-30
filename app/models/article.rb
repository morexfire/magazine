class Article < ActiveRecord::Base
  has_many :contributions
  has_many :contributors, :through => :contributions

  default_scope { order("published_at desc") }

  validates :title,    presence: true
  validates :subtitle, presence: true
  validates :content,  presence: true
  validates :published_at, :year, :month, :day, :slug,
            presence:true, unless: :new_record?

  before_create :set_published_at_attrs, :set_slug
  before_update :set_published_at_attrs, :set_slug

  def path
    "/" + [year, month, day, slug].compact.join("/")
  end

  def params
    { year: year, month: month, day: day, slug: slug }
  end

  def name
    [title, subtitle].join(" : ")
  end

  def contributors(role)
    contributors = []

    self.contributions.each do |c|
      if c.role.name == role
        contributors << c
      end
    end

    contributors
  end

  def authors
    contributors("author")
  end

  def photographers
    contributors("photographer")
  end

  def illustrators
    contributors("illustrator")
  end

  private

  def set_published_at_attrs
    self.published_at ||= Time.zone.now
    self.year   = published_at.year
    self.month  = published_at.month.to_s.rjust(2, "0")
    self.day    = published_at.day.to_s.rjust(  2, "0")
  end

  def set_slug
    blank       = ""
    separator   = "-"
    self.slug ||= name
    self.slug   = slug.downcase.
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
