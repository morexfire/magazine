module ApplicationHelper
  def xml_declaration
    %q{<?xml version="1.0" encoding="UTF-8"?>}
  end

  def year_month(year, month)
    "#{year}-#{month.to_s.rjust(2, "0")}"
  end

  def now_year_month
    year_month(Time.now.year, Time.now.month)
  end

  def start_year_month
    year_month(setting(:start_year), setting(:start_month))
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

  def link_to_dates(year: nil, month: nil, day: nil, show_year: true, show_month: true, show_day: true)
    show_month = false if month.nil?
    show_day   = false if day.nil?

    links = []

    month = month.to_s.rjust(2, "0") unless month.nil?
    day   = day.to_s.rjust(2, "0")   unless day.nil?

    if year && show_year
      links << link_to_unless_current(year,  articles_path(year),               rel: "archives", class: "year")
    end
    if month && show_month
      links << link_to_unless_current(month, articles_path(year, month),        rel: "archives", class: "month")
    end
    if day && show_day
      links << link_to_unless_current(day,   articles_path(year, month, day),   rel: "archives", class: "day")
    end

    links.join("-").html_safe
  end

  def setting(key)
    Setting.where(key: key).first.try(:content)
  end

  def license(key)
    License.find(setting(:license)).send(key)
  end
end
