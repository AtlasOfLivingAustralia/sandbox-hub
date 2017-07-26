package au.org.ala.sandbox

import grails.plugins.Plugin

class SandboxHubGrailsPlugin extends Plugin {

    def version = "2.0.0-SNAPSHOT"

    // the version or versions of Grails the plugin is designed for
    def grailsVersion = "3.2.11 > *"
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
    def profiles = ['web']

    // URL to the plugin's documentation
    def documentation = "http://grails.org/plugin/sandbox-hub"

    // Extra (optional) plugin metadata

    // License: one of 'APACHE', 'GPL2', 'GPL3'
//    def license = "APACHE"

    // Details of company behind the plugin (if there is one)
//    def organization = [ name: "My Company", url: "http://www.my-company.com/" ]

    // Any additional developers beyond the author specified above.
//    def developers = [ [ name: "Joe Bloggs", email: "joe@bloggs.net" ]]

    def issueManagement = [system: "GITHUB", url: "https://github.com/AtlasOfLivingAustralia/sandbox-hub/issues"]

    // Online location of the plugin's browseable source code.
    def scm = [url: "https://github.com/AtlasOfLivingAustralia/sandbox-hub"]

    Closure doWithSpring() {
        { ->
            // TODO Implement runtime spring config (optional)
        }
    }

    void doWithDynamicMethods() {
        // TODO Implement registering dynamic methods to classes (optional)
    }

    void doWithApplicationContext() {
        // TODO Implement post initialization spring config (optional)
    }

    void onChange(Map<String, Object> event) {
        // TODO Implement code that is executed when any artefact that this plugin is
        // watching is modified and reloaded. The event contains: event.source,
        // event.application, event.manager, event.ctx, and event.plugin.
    }

    void onConfigChange(Map<String, Object> event) {
        // TODO Implement code that is executed when the project configuration changes.
        // The event is the same as for 'onChange'.
    }

    void onShutdown(Map<String, Object> event) {
        // TODO Implement code that is executed when the application shuts down (optional)
    }
}
