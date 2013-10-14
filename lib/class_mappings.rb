class ClassMappings

	DEFAULT_IS_MAPPING = 199

	MAPPINGS = {
		'Start1013' => 201,
		'Boot1013' => 203,
		'Euro1013' => 205,
		'Fam1013' => 207,
		'Cons1013' => 209
	}

	def self.for_cohort(cohort)
		MAPPINGS[cohort]
	end

end