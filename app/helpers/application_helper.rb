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
    if @title.nil?
      setting(:site_name)
    else
      [@title, setting(:site_name)].join(" | ")
    end
  end

  def canonical_url(page=nil)
    # TODO urls for pages other than home and article

    url = setting(:site_url)

    if page.is_a?(Article)
      url += page.path
    end

    page.nil? ? setting(:site_url) : url
  end

  def meta_og_site_name_tag(page=nil)
    tag(:meta, property: "og:site_name", content: setting(:site_name))
  end

  def meta_fb_app_id_tag(page=nil)
    tag(:meta, property: "fb:app_id", content: setting(:fb_app_id))
  end

  def meta_og_image_tag(page=nil)
    # TODO
    content = page.nil? ? "site image" : "page.photo"
    tag(:meta, property: "og:image", content: content)
  end

  def meta_og_url_tag(page=nil)
    content = page.nil? ? setting(:site_url) : canonical_url(page)
    tag(:meta, property: "og:url", content: content)
  end

  def meta_og_title_tag(page=nil)
    # TODO
    content = page.nil? ? setting(:site_name) : "Title of the article"
    tag(:meta, property: "og:description", content: content)
  end

  def meta_og_description_tag(page=nil)
    # TODO
    content = page.nil? ? setting(:site_description) : "Description of the article"
    tag(:meta, property: "og:description", content: content)
  end

  def meta_og_type_tag(page=nil)
    content = page.nil? ? "website" : "article"
    tag(:meta, property: "og:type", content: content)
  end

  def asset_url(type, file, extension)
    [
      setting(:asset_host),
      type.to_s.downcase.pluralize,
      "/",
      file,
      ".",
      extension.to_s.downcase,
    ].join
  end

  def link_to_dates(year=nil, month=nil, day=nil)
    # TODO add display pattern

    links = []

    links << link_to_unless_current(year,  articles_path(year),               rel: "archives", class: "year")  if year
    links << link_to_unless_current(month, articles_path(year, month),        rel: "archives", class: "month") if month
    links << link_to_unless_current(day,   articles_path(year, month, day),   rel: "archives", class: "day")   if day

    links.join("-").html_safe
  end

  def setting(key)
    Setting.where(key: key).first.content
  end
end
