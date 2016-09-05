class SandboxHubGrailsPlugin {
    // the plugin version
    def version = "0.1-SNAPSHOT"
    // the version or versions of Grails the plugin is designed for
    def grailsVersion = "2.3 > *"
    // resources that are excluded from plugin packaging
    def pluginExcludes = [
        "grails-app/views/error.gsp"
    ]

    // TODO Fill in these fields
    def title = "Sandbox Hub Plugin" // Headline display name of the plugin
    def author = "Temi Varghese"
    def authorEmail = ""
    def description = '''\
        Sandbox hub separates sandbox UI (angular app) from backend methods. This plugin will enable apps to include sandbox UI while committing data on a different server.
    '''

    // URL to the plugin's documentation
    def documentation = "http://grails.org/plugin/sandbox-hub"

    // License: one of 'APACHE', 'GPL2', 'GPL3'
    def license = "MOZILLA"

    // Details of company behind the plugin (if there is one)
//    def organization = [ name: "My Company", url: "http://www.my-company.com/" ]

    // Any additional developers beyond the author specified above.
    def developers = [ [ name: "Simon Bear" ]]

    // Location of the plugin's issue tracker.
    def issueManagement = [ system: "GITHUB", url: "https://github.com/AtlasOfLivingAustralia/sandbox-hub/issues" ]

    // Online location of the plugin's browseable source code.
    def scm = [ url: "https://github.com/AtlasOfLivingAustralia/sandbox-hub" ]

    def doWithSpring = {
        def config = application.config
    }
}
