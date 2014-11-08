module ApplicationHelper
  def starting_year; 2014; end
  def starting_month;  10; end

  def year_month(year, month)
    "#{year}-#{month.to_s.rjust(2, "0")}"
  end

  def now_year_month
    year_month(Time.now.year, Time.now.month)
  end

  def starting_year_month
    year_month(starting_year, starting_month)
  end

  def page_title
    site_title = "All Attack, No Hold Back"

    if @title.nil?
      site_title
    else
      [@title, site_title].join(" | ")
    end
  end

  def canonical_url(page=nil)
    page.nil? ? "http://allattacknoholdback.com" : "page.url"
  end

  def meta_og_site_name_tag(page=nil)
    tag(:meta, property: "og:site_name", content: "All Attack, No Hold Back")
  end

  def meta_fb_app_id_tag(page=nil)
    tag(:meta, property: "fb:app_id", content: "")
  end

  def meta_og_image_tag(page=nil)
    content = page.nil? ? "site image" : "page.photo"
    tag(:meta, property: "og:image", content: content)
  end

  def meta_og_url_tag(page=nil)
    content = page.nil? ? "http://allattacknoholdback.com" : canonical_url(page)
    tag(:meta, property: "og:url", content: content)
  end

  def meta_og_title_tag(page=nil)
    content = page.nil? ? "All Attack, No Hold Back" : "Title of the article"
    tag(:meta, property: "og:description", content: content)
  end

  def meta_og_description_tag(page=nil)
    content = page.nil? ? "Description of the website" : "Description of the article"
    tag(:meta, property: "og:description", content: content)
  end

  def meta_og_type_tag(page=nil)
    content = page.nil? ? "website" : "article"
    tag(:meta, property: "og:type", content: content)
  end

  def asset_url(type, file, extension)
    [
      "http://assets.allattacknoholdback.com.s3.amazonaws.com/",
      type.to_s.downcase.pluralize,
      "/",
      file,
      ".",
      extension.to_s.downcase,
    ].join
  end

  def link_to_dates(year=nil, month=nil, day=nil)
    links = []

    links << link_to_unless_current(year,  articles_path(year),               rel: "archives") if year
    links << link_to_unless_current(month, articles_path(year, month),        rel: "archives") if month
    links << link_to_unless_current(day,   articles_path(year, month, day),   rel: "archives") if day

    links.join("-").html_safe
  end
end
