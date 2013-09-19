class CourseModule < ActiveRecord::Base
  attr_accessible :description, :name, :unlocks_in_number, :unlocks_in_unit

  before_save :write_unlocks_in

  def unlocks_in_stamp
  	"#{unlocks_in_number} #{unlocks_in_unit}"
  end

  private

  def write_unlocks_in
  	self.unlocks_in = unlocks_in_number.send(unlocks_in_unit)
  end


end
