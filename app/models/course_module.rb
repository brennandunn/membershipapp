class CourseModule < ActiveRecord::Base
  attr_accessible :description, :name, :unlocks_in_number, :unlocks_in_unit

  has_many :lessons, order: 'position asc'

  before_save :write_unlocks_in

  def unlocks_in
    self[:unlocks_in] || Time.now
  end

  def unlocks_in_stamp
  	"#{unlocks_in_number} #{unlocks_in_unit}"
  end

  def description_html
    SiteConfig.markdown.render(description).html_safe
  end

  private

  def write_unlocks_in
  	self.unlocks_in = unlocks_in_number.send(unlocks_in_unit)
  end


end
