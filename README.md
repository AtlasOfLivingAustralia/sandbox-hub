# sandbox-hub
Sandbox hub separates sandbox UI (angular app) from backend methods. This plugin will enable apps to include sandbox UI while committing data on a different server.

## Getting started
The easiest way to get started is add **collectory-hub** as a plugin in BuildConfig.groovy. Any functionality that you wish to alter, is achieved by creating a copy of the groovy/GSP/JS/CSS/i18n file of interest, from **collectory-hub** and placing it in your client app, so that it overrides the plugin version.

E.g. to change the header and footer, create a copy of the file `https://github.com/AtlasOfLivingAustralia/ala-bootstrap3/blob/grails3/grails-app/views/layouts/main.gsp` (calling it generic.gsp) and then edit the configuration file to point to this new GSP file: `grails-app/conf/application.groovy` - set `skin.layout = 'generic'`.

A full list of the configuration settings (and their default values) are found in `grails-app/views/_configjs.gsp`.

