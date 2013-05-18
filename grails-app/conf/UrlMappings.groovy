class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/"(controller:"index", max: "5", maxsteps: "3")
		"500"(view:'/error')
	}
}
