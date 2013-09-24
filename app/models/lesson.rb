class Lesson < ActiveRecord::Base
  attr_accessible :content, :course_module_id, :name, :position

  belongs_to :course_module

  def content_html
    SiteConfig.markdown.render(content).html_safe
  end

end
