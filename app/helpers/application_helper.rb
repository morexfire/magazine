module ApplicationHelper
  def page_title(page=nil)
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
end
