// cut down app with no routes, etc for just running the preview page standalone
(function sandbox(config) {
    "use strict";
    var sandbox = angular.module('ala.sandbox', ['ngAnimate', 'ngAria', 'ngTouch', 'ui.bootstrap', 'ala.sandbox.components', 'ala.sandbox.keepalive', 'ala.sandbox.preview', 'chieffancypants.loadingBar', 'ngFileUpload']);

    sandbox.value('sandboxConfig', config);

    sandbox.config(['cfpLoadingBarProvider', function (cfpLoadingBarProvider) {
        cfpLoadingBarProvider.includeSpinner = false;
    }]);

    sandbox.run(['$rootScope', 'sandboxConfig', function ($rootScope, sandboxConfig) {
        $rootScope.admin = _.contains(sandboxConfig.roles, 'ROLE_ADMIN');
        $rootScope.isAdmin = function () {
            return $rootScope.admin;
        }
    }]);

})(SANDBOX_CONFIG);