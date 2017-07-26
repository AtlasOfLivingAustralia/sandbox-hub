<script type="text/javascript">
    var SANDBOX_CONFIG = {
        sandboxHubsWebappUrl: '${grailsApplication.config.biocache.baseURL}',
        linkToSpatialPortal: '${(grailsApplication.config.preview.complete.linkToSpatialPortal ?: false) as Boolean}',
        linkToDownload: '${(grailsApplication.config.preview.complete.linkToDownload ?: false) as Boolean}',
        autocompleteColumnHeadersUrl: '${createLink(controller:'dataCheck', action:'autocomplete')}',
        keepaliveUrl: '${createLink(controller: 'sandbox', action: 'ping')}',
        parseColumnsUrl: '${createLink(controller:'dataCheck', action:'parseColumns')}',
        processDataUrl: '${createLink(controller:'dataCheck', action:'processData')}',
        reloadDataResourceUrl: '${createLink(controller:'dataCheck', action:'reload')}',
        uploadCsvUrl: '${createLink(controller:'dataCheck', action:'uploadFile')}',
        uploadToSandboxUrl: '${createLink(controller:'dataCheck', action:'upload')}',
        uploadStatusUrl: '${createLink(controller:'dataCheck', action:'uploadStatus')}',
        roles: <u:roles />,
        dataTypeToolTip: '${raw(grailsApplication.config.dataTypeToolTip)}',
        dataTypeRegEx: new RegExp('${raw(grailsApplication.config.dataTypeRegEx)}')
    };
</script>