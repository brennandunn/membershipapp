class SiteConfig < ActiveRecord::Base

  def self.site_name
    load_var :name
  end

  def self.css

  end

  def self.resources
  	raw = load_var :resources
  	markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true)
  	markdown.render(raw).html_safe
  end

  private

  def self.load_var(name)
  	first.send name
  end

end
