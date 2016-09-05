/*
 * Copyright (C) 2016 Atlas of Living Australia
 * All Rights Reserved.
 *
 * The contents of this file are subject to the Mozilla Public
 * License Version 1.1 (the "License"); you may not use this file
 * except in compliance with the License. You may obtain a copy of
 * the License at http://www.mozilla.org/MPL/
 *
 * Software distributed under the License is distributed on an "AS
 * IS" basis, WITHOUT WARRANTY OF ANY KIND, either express or
 * implied. See the License for the specific language governing
 * rights and limitations under the License.
 * 
 * Created by Temi on 29/08/2016.
 */
modules = {
    // cut down version of application for preview screen only
//    angular {
//        resource url: [dir: 'node_modules/angular', file: 'angular.js', plugin:'sandbox-hub']
//        resource url: [dir: 'node_modules/angular', file: 'angular-csp.css', plugin:'sandbox-hub']
//    }

    'angular-ui-bootstrap' {
        dependsOn('angular')
        resource url: [dir: 'node_modules/angular-ui-bootstrap/dist', file: 'ui-bootstrap-csp.css', plugin:'sandbox-hub']
        resource url: [dir: 'node_modules/angular-ui-bootstrap/dist', file: 'ui-bootstrap-tpls.js', plugin:'sandbox-hub']
    }

    'angular-ui-dependencies'{
        dependsOn('angular', 'angular-ui-bootstrap')
        resource url: [dir: 'node_modules/angular-animate', file: 'angular-animate.js', plugin:'sandbox-hub']
        resource url: [dir: 'node_modules/angular-touch', file: 'angular-touch.js', plugin:'sandbox-hub']
    }

    preview {
        dependsOn 'ala', 'angular', 'angular-ui-bootstrap', 'angular-ui-dependencies'
        resource url: [dir: 'css', file: 'sandbox.css', plugin:'sandbox-hub']
        resource url: [dir: 'node_modules/angular-loading-bar/build', file: 'loading-bar.css', plugin:'sandbox-hub']
        resource url: [dir: 'node_modules/angular-aria', file: 'angular-aria.js', plugin:'sandbox-hub']
        resource url: [dir: 'node_modules/angular-loading-bar/build', file: 'loading-bar.js', plugin:'sandbox-hub']
        resource url: [dir: 'node_modules/ng-file-upload/dist', file: 'ng-file-upload.js', plugin:'sandbox-hub']
        resource url: [dir: 'node_modules/underscore', file: 'underscore.js', plugin:'sandbox-hub']
        resource url: [dir: 'js', file: 'keepalive.js', plugin:'sandbox-hub']
        resource url: [dir: 'js', file: 'components.js', plugin:'sandbox-hub']
        resource url: [dir: 'js', file: 'preview.js', plugin:'sandbox-hub']
    }
}

