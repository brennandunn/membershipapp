if ENV['FG']
	Infusionsoft.configure do |config|
  	config.api_url = ENV['INFUSIONSOFT_HOST'] # example infused.infusionsoft.com
  	config.api_key = ENV['INFUSIONSOFT_KEY']
	end
end