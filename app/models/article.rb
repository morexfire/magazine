require "securerandom"

class Article < ActiveRecord::Base
  has_many :contributions
  has_many :contributors, :through => :contributions

  validates :title,    presence: true
  validates :subtitle, presence: true
  validates :content,  presence: true
  validates :published_at, :year, :month, :day, :slug,
            presence:true, unless: :new_record?

  before_create :set_published_at_attrs, :set_slug, :set_code
  before_update :set_published_at_attrs, :set_slug

  scope :draft,     -> { where(status: "draft")     }
  scope :queued,    -> { where(status: "queued")    }
  scope :published, -> { where(status: "published") }
  default_scope        { order("published_at desc") } # newest first

  def path
    "/" + [year, month, day, slug].compact.join("/")
  end

  def params
    { year: year, month: month, day: day, slug: slug }
  end

  def name
    [title, subtitle].join(" : ")
  end

  def contributors(role=nil)
    contributors = []

    self.contributions.each do |c|
      if c.role.name == role || role.nil?
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

  def photo
    "#{Setting.find_by(key: "asset_host").content}articles/#{year}/#{month}/#{day}/photo.jpg"
  end

  def draft!
    self.status = "draft"
    self.save
  end

  def draft?
    self.status == "draft"
  end

  def queue!
    self.status = "queue"
    self.save
  end

  def queued?
    self.status == "queue"
  end

  def publish!
    self.status = "published"
    self.save
  end

  def published?
    self.status == "published"
  end

  private

  def set_published_at_attrs
    self.published_at ||= Time.zone.now
    self.year   = published_at.year
    self.month  = published_at.month.to_s.rjust(2, "0")
    self.day    = published_at.day.to_s.rjust(  2, "0")
  end

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

  def set_code
    self.code = SecureRandom.hex
  end
end
