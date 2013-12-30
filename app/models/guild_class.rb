class GuildClass
	include Comparable

	attr_reader :name, :users

	def <=>(other)
		creation_date <=> other.creation_date
	end

	def initialize(name, users)
		@name = name
		@users = users.sort_by(&:name)
	end

	def official_class?
		ClassMappings::MAPPINGS.key?(name)
	end

	def creation_date
		@users.map(&:created_at).sort.first
	end

end