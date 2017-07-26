package au.org.ala.sandbox

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(controller: "sandbox", view: "index")
        "500"(view:'/error')
    }
}
