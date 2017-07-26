<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/html">
<head>
    <g:render template="/configjs"/>

    <title>${grailsApplication.config.skin.appName} | ${grailsApplication.config.skin.orgNameLong}</title>

    <meta name="breadcrumb" content="${grailsApplication.config.skin.appName}"/>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="fluidLayout" content="true" />
    <meta name="layout" content="${grailsApplication.config.skin.layout ?: 'main'}"/>

    <g:if test="${params.tag}">
        <asset:stylesheet src="embedded"/>
    </g:if>

    <asset:stylesheet src="sandbox-hub"/>
    <asset:javascript src="sandbox-hub"/>

    <g:if env="production">
        <asset:javascript src="sandbox-hub-prod"/>
    </g:if>

    <asset:script>
      angular.module('ala.sandbox.preview').value('existing', <dc:json value="${dataResource}"/> );
      angular.module('ala.sandbox.preview').value('file', <dc:json value="${file}"/> );
      angular.module('ala.sandbox.preview').value('tag', '${params.tag}');
      angular.module('ala.sandbox.preview').value('redirectToSandbox', ${redirectToSandbox});
    </asset:script>

    <renderLayout/>
</head>
<body>
<div class="row">
    <div class="col-sm-12 col-md-12" ng-app="ala.sandbox" ng-controller="PreviewCtrl as preview" ng-cloak>
        <g:render template="/sandbox/preview/shared"/>
        <g:render template="/alertModals"/>
    </div>
</div>
</body>
</html>