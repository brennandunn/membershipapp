class DirectoryController < ApplicationController

  before_filter :authenticate_user!
	before_filter :can_view_directory?

  def index
  	@classes = User.all.group_by(&:cohort).map { |name, users| GuildClass.new(name, users) }.sort
  end

  def show
  end

  def search
  end

  private

  def can_view_directory?
  	@wide_view = true
  end

end
