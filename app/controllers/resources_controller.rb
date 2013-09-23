class ResourcesController < ApplicationController

	def show
	end

	def edit
	end

	def update
		config = SiteConfig.first
		config.resources = params[:site_config][:resources]
		config.save
		redirect_to action: :show
	end

end