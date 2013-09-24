class LessonsController < ApplicationController
	load_and_authorize_resource :course_module
  load_and_authorize_resource :through => :course_module

	def new
	end

	def create
		@lesson.save
		redirect_to edit_course_module_path(@course_module)
	end

end