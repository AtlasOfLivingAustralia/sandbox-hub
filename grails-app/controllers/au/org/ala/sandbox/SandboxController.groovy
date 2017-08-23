package au.org.ala.sandbox

class SandboxController {
    def index() {
        def model = [existing: [:], reload: false]
        render view:'index', model: model
    }

    def ping() {
        response.status = 201
    }
}
