<g:set var="sandboxUrl" value="${grailsApplication.config.sandbox.uiUrl}"></g:set>
<r:script type="text/javascript" disposition="head">
    var SANDBOX_CONFIG = {
        autocompleteColumnHeadersUrl: '${sandboxUrl}/dataCheck/autocomplete',
        biocacheServiceUrl: '${grailsApplication.config.biocacheServiceUrl}',
        chartOptionsUrl: '${sandboxUrl}/myDatasets/chartOptions',
        deleteResourceUrl: '${sandboxUrl}/myDatasets/deleteResource',
        getAllDatasetsUrl: '${sandboxUrl}/myDatasets/allDatasets',
        getDatasetsUrl: '${sandboxUrl}/myDatasets/userDatasets',
        keepaliveUrl: '${sandboxUrl}/dataCheck/ping',
        loginUrl: '${grailsApplication.config.casServerLoginUrl}?service=${createLink(uri: '/', absolute: true)}',
        parseColumnsUrl: '${sandboxUrl}/dataCheck/parseColumns',
        processDataUrl: '${sandboxUrl}/dataCheck/processData',
        reloadDataResourceUrl: '${sandboxUrl}/dataCheck/reload',
        saveChartOptionsUrl: '${sandboxUrl}/myDatasets/saveChartOptions',
        uploadCsvUrl: '${sandboxUrl}/dataCheck/uploadFile',
        uploadToSandboxUrl: '${sandboxUrl}/dataCheck/upload',
        uploadStatusUrl: '${sandboxUrl}/dataCheck/uploadStatus',
        userId: '${u.userId()}',
        roles:<u:roles />
        };
</r:script>