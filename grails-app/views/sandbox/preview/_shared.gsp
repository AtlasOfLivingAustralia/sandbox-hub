<div class="btn-toolbar pull-right" role="toolbar" aria-label="Sandbox tools" id="sandboxToolsDiv">
    <div class="btn-group" role="group" aria-label="Datasets">
        <g:link class="btn btn-default" controller="tempDataResource" action="myData">My uploaded datasets</g:link>
        <g:link class="btn btn-default" ng-show="isAdmin()" controller="tempDataResource" action="adminList">All Datasets</g:link>
    </div>
    <div ng-show="preview.existing.uid" class="btn-group" role="group" aria-label="Current dataset">
        <a class="btn btn-default" ng-href="${createLink(controller: 'tempDataResource', action: 'viewMetadata')}?uid={{preview.existing.uid}}">View/edit details</a>
        <a class="btn btn-default"
           ng-href="${grailsApplication.config.biocache.baseURL}/occurrences/search?q=data_resource_uid:{{preview.existing.uid}}">View records</a>
        <button class="btn btn-default" ng-click="preview.unlinkFromExisting()">Reset Data Resource ID</button>
    </div>
</div>

<h1>${grailsApplication.config.skin.appName}<small ng-show="preview.existing.uid"> Reloading {{ preview.dataResourceUid }} ({{preview.datasetName }})</small></h1>

<p>
    This is a sandbox environment for data uploads, to allow users to view their data with mapping & analysis tools.
</p>

<div class="panel panel-default">
    <div class="panel-heading">
        <h2 class="panel-title">1. Load data here</h2>
    </div>

    <div class="panel-body">
        <uib-alert type="info">
            <p>Please note that for the records in a data set to be effectively discoverable and able to be mapped it
            needs to meet a minimum set of standards. Data needs to include, at a minimum: <code>scientificName</code> /
            <code>vernacularName</code> to identify the organism and <code>eventDate</code>,
            <code>decimalLatitude</code> and <code>decimalLongitude</code> to indicate where and when the occurrence
            happened. The data needs to have a unique identifier column - either <code>catalogNumber</code> or
            <code>occurrenceID</code> with a unique value for each record. The number of columns must match the number
            of column headers (problems with this often indicate commas and/or line breaks in the fields).</p>
            <p>Additional fields will increase the usability of the data.</p>
        </uib-alert>
        <uib-tabset active="preview.selectedTab">
            <uib-tab heading="Paste CSV" disable="(preview.file && preview.fileId) || preview.lockedFile">
                <p>
                    This tool accepts comma separated values (CSV) and tab separated data.
                </p>

                <p>To paste your data, click the rectangle below, and type <kbd><kbd>ctrl</kbd> + <kbd>V</kbd></kbd> (Windows)
                or <kbd><kbd>&#8984;</kbd> + <kbd>V</kbd></kbd> (OS X). For a large amount of data, this may take a while to parse.
                </p>

                <div class="form">
                    <div class="form-group">
                        <textarea id="copyPasteData" class="form-control" name="copyPasteData" rows="10"
                                  cols="120" ng-model="preview.text" ng-change="preview.parseColumns()" allow-tab
                                  ng-model-options="{ debounce: { 'default': 1500, 'blur': 0 } }"
                                  ng-disabled="preview.parsing || preview.processingData || preview.uploading"></textarea>
                    </div>

                    <button type="button" id="checkDataButton" class="btn btn-primary"
                            ng-click="preview.parseColumns()" ng-disabled="preview.parsing || preview.processingData || preview.uploading"
                            ng-bind="preview.checkDataLabel()"></button>
                    <button type="button" class="btn btn-default" ng-click="preview.text = ''; preview.parseColumns()" ng-disabled="preview.parsing || preview.processingData || preview.uploading">Clear</button>
                </div>
            </uib-tab>
            <uib-tab heading="Load File" disable="preview.text">
                <p>
                    This is a sandbox environment for data uploads, to allow users to view their data with ALA tools.
                    This is currently an <strong>experimental</strong> feature of the Atlas.<br/>
                    Uploaded data will be <strong>periodically cleared</strong> from the system.
                    <br/>
                    This tool accepts Excel spreadsheets and
                    <a target="_blank" href="http://en.wikipedia.org/wiki/Comma-separated_values">CSV</a> files.
                For large files, its recommended that the files are
                    <a target="_blank" href="http://en.wikipedia.org/wiki/Zip_(file_format)">zipped</a>
                    before uploading.
                </p>

                <div class="form">
                    <label class="btn btn-default btn-file"
                           ng-class="{'disabled': preview.parsing || preview.lockedFile}">
                        {{preview.file.name || 'Select File' }} <input type="file" ngf-select ng-model="preview.file"
                                                                       ng-disabled="preview.parsing || preview.lockedFile"
                                                                       style="display: none;">
                    </label>
                    <button type="button" class="btn btn-success" ng-show="preview.file && preview.file.name"
                            ng-disabled="preview.parsing || preview.processingData || preview.uploading || preview.lockedFile"
                            ng-click="preview.uploadCsvFile()" ng-bind="preview.uploadCsvStatusLabel()"></button>
                    <button type="button" class="btn btn-default" ng-show="preview.file && preview.file.name"
                            ng-disabled="preview.parsing || preview.processingData || preview.uploading || preview.lockedFile"
                            ng-click="preview.file = null; preview.fileId = null; preview.parseColumns()">Clear</button>
                </div>
            </uib-tab>
        </uib-tabset>

        <p id="processingInfo"></p>
    </div><!-- panel body -->
</div><!-- panel -->
<div class="panel panel-default" id="recognisedDataDiv" ng-show="preview.previewLoaded">
    <div class="panel-heading">
        <h2 class="panel-title">2. Check our initial interpretation</h2>
    </div>

    <div class="panel-body">
        <p>Adjust headings that have been incorrectly matched using the text boxes.
        Fields marked in <strong>yellow</strong> havent been matched to a recognised field name
        (<a href="http://rs.tdwg.org/dwc/terms/" target="_blank">darwin core terms</a>).<br/>

            After adjusting, click
            <button type="button" class="btn btn-default" ng-disabled="preview.processingData || preview.uploading"
                    ng-click="preview.getProcessedData()" ng-bind="preview.reprocessDataLabel()"></button>
        </p>

        <div class="well">
            <div id="recognisedData">
                <div id="interpretation">
                    <label for="firstLineIsData">The first line is:</label>
                    <select id="firstLineIsData" name="firstLineIsData" ng-model="preview.preview.firstLineIsData"
                            ng-change="preview.reparseColumns()" ng-options="o.value as o.label for o in preview.firstLineOptions"
                            ng-disabled="preview.processingData || preview.uploading">
                    </select>
                </div>

                <div id="tabulatedData" style="overflow: auto;">
                    %{--<h1></h1>--}%
                    <table id="initialParse" class="table table-bordered">
                        <thead>
                        <tr>
                            <th ng-repeat="header in preview.preview.headers" style="vertical-align:top;">
                                <input class="columnHeaderInput" type="text" autocomplete="off" name="q"
                                       ng-model="header.header" ng-change="preview.headerChanged(header)"
                                       ng-class="{unrecognizedField: !header.known}"
                                       uib-typeahead="dwc for dwc in preview.autocompleteColumnHeaders($viewValue)"
                                       typeahead-on-select="preview.headerValueSelected(header)"
                                       typeahead-select-on-blur="true" typeahead-select-on-exact="true"
                                       ng-blur="preview.headerBlur(header)"
                                       ng-disabled="preview.processingData || preview.uploading"
                                />
                                <select name="h" ng-model="header.dataType" uib-tooltip-html="preview.trustedTooltip"
                                        tooltip-placement="right"
                                        ng-disabled="header.known" ng-change="preview.dataTypeChanged(header)">
                                    %{--<option value=""/>--}%
                                    <option value="{{value.suf}}"
                                            ng-model="header.selectedDataType"
                                            ng-selected="{{value.id == defaultDataType}}"
                                            ng-repeat="value in preview.dataTypeOptions">
                                        {{value.label}}
                                    </option>
                                </select>
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr ng-repeat="row in preview.preview.dataRows track by $index">
                            <td ng-repeat="value in row track by $index" class="scrollCell"><div ng-bind="value"></div></td>
                        </tr>
                        </tbody>
                    </table>

                    <div id="jsonBlob" style="visibility: hidden; display:none;">
                        <pre id="columnHeaders"
                             ng-bind="preview.preview.headers | json"></pre>
                    </div>
                </div>
            </div>
            <button type="button" class="btn btn-default" ng-disabled="preview.processingData || preview.uploading"
                    ng-click="preview.getProcessedData()" ng-bind="preview.reprocessDataLabel()"></button>
        </div>
    </div><!-- panel-body -->
</div><!-- recognisedDataDiv -->

<div class="panel panel-default" id="processSample" ng-show="preview.previewLoaded">
    <div class="panel-heading">
        <h2 class="panel-title">3. Process sample & upload to sandbox</h2>
    </div>

    <div class="panel-body">
        <div id="processSampleUpload">
            <p style="display:none;">
                <label for="customIndexedFields">Custom index fields</label>
                <input type="text" name="customIndexedFields" id="customIndexedFields" value=""/>
            </p>

            <p>
                The tables below display the first few records and our interpretation. The <strong>Processed value</strong>
                displays the results of name matching, sensitive data lookup and reverse geocoding where coordinates have been supplied.<br/>
                If you are happy with the initial processing, please give your dataset a name, and upload into the sandbox.
                This will process all the records and allow you to visualise your data on a map.
            </p>

            <div class="well">
                <form class="form-inline">
                    <uib-alert ng-if="preview.isMissingUsefulColumns">Your dataset is missing the following useful fields: <code ng-bind="preview.missingUsefulColumnsMessage"></code></uib-alert>
                    <uib-alert ng-if="!(preview.processedData.validationMessages.length == 0)">There are errors in the dataset that needs to be fixed before you can upload.
                        <span ng-repeat="validationMsg in preview.processedData.validationMessages"><br/><code>{{ validationMsg }} </code></span>
                    </uib-alert>
                    <div class="form-group">
                        <label for="datasetName" class="datasetName"><strong>Your dataset name</strong></label>
                        <input id="datasetName" class="datasetName form-control" name="datasetName" type="text"
                               ng-model="preview.datasetName" ng-disabled="preview.uploading" />
                    </div>
                    <button type="button" id="uploadButton" class="btn btn-primary"
                            ng-click="preview.uploadToSandbox()" ng-bind="preview.uploadToSandboxLabel()" ng-disabled="(preview.uploading || !(preview.processedData.validationMessages.length == 0))">Upload your data</button>
                    <button type="button" id="resetButton" class="btn btn-warning" ng-show="preview.existing.uid"
                            ng-click="preview.unlinkFromExisting(); preview.uploadToSandbox();" ng-disabled="preview.uploading">Upload as a new resource instead</button>
                </form>

                <div id="uploadFeedback" ng-show="preview.uploading || preview.uploadFailed">
                    <p ng-show="preview.uploadPercent == 0 && !preview.uploadFailed" class="uploaded">Starting upload of dataset....</p>
                    <span ng-show="preview.uploadPercent > 0 && preview.uploading < 100 && !preview.uploadFailed">Percentage completed: {{ preview.uploadPercent }}%. </span><span>STATUS: {{preview.uploadStatus}}, {{ preview.uploadDescription }}</span>
                    <span ng-show="preview.uploadFailed">Dataset upload <strong>failed</strong>. Please email <a href="mailto:${grailsApplication.config.skin.supportEmail}">${grailsApplication.config.skin.supportEmail}</a> with the details of your dataset.</span>
                </div>

                <uib-progressbar class="progress-striped" ng-class="{ active: preview.uploadPercent < 100 }"
                                 ng-show="preview.uploading" value="preview.uploadPercent"
                                 type="{{ preview.uploadPercent < 100 ? 'info': 'success'}}" title="Upload progress">
                    <b>{{preview.uploadPercent}}%</b>
                </uib-progressbar>

                <div id="optionsAfterDownload" ng-show="preview.uploadPercent == 100"
                     style="margin-bottom: 0; padding-bottom: 0;">

                    <h2 style="margin-top:25px;">Next steps:</h2>

                    <div class="row">
                        <div class="col-sm-12" ng-if="!preview.redirectToSandbox && !preview.tag">
                            <g:if test="${(grailsApplication.config.preview.complete.linkToSpatialPortal ?: false) as Boolean}">
                            <a ng-href="${createLink(controller: 'dataCheck', action: 'redirectToSpatialPortal')}?uid={{preview.dataResourceUid}}" id="spatialPortalLink" class="btn btn-default"
                               title="Mapping &amp; Analysis in the Spatial portal">Mapping & Analysis with your data</a>
                            </g:if>
                            <a ng-href="${createLink(controller: 'dataCheck', action: 'redirectToBiocache')}?uid={{preview.dataResourceUid}}" id="hubLink" class="btn btn-default"
                               title="Review data">Review data</a>
                            <g:if test="${(grailsApplication.config.preview.complete.linkToDownload ?: false) as Boolean}">
                            <a ng-href="${createLink(controller: 'dataCheck', action: 'redirectToDownload')}?uid={{preview.dataResourceUid}}" id="downloadLink" class="btn btn-default"
                               title="Life Science Identifier (pop-up)">Download the processed version of your data</a>
                            </g:if>
                        </div>

                        <div class="col-sm-12" ng-if="preview.redirectToSandbox && !preview.tag">
                            <a ng-href="${createLink(controller: 'dataCheck', action: 'redirectToSpatialPortal')}?uid={{preview.dataResourceUid}}"
                               class="btn btn-default"
                               title="Continue analysis in the Spatial Portal">Continue analysis in the Spatial Portal</a>
                        </div>
                    </div>
                </div>

            </div><!--well-->
        </div><!-- processSampleUpload-->
    </div><!-- panel-body -->
</div><!-- processSample -->

<div id="processedData" ng-show="preview.previewLoaded && preview.processedData">
    <p>Click to show details of processed sample records</p>
    <uib-accordion close-others="true">
        <uib-accordion-group ng-repeat="processedRecord in preview.processedData.processedRecords" is-open="processedRecord.isOpen" >
            <uib-accordion-heading>
                <span ng-bind="preview.processedRecordHeader(processedRecord)"></span><i class="pull-right fa fa-chevron-right animate" ng-class="{'fa-rotate-90': processedRecord.isOpen }"></i>
            </uib-accordion-heading>
            <table class="table table-bordered" >
                <thead>
                <tr>
                    <th class="fieldNameTD">Field name</th>
                    <th>Original value</th>
                    <th>Processed value</th>
                </tr>
                </thead>
                <tbody>
                <tr ng-repeat="field in processedRecord.values">
                    <td class="fieldNameTD" ng-class="preview.processedRecordFieldClass(field)" ng-bind="field.camelCaseName"></td>
                    <td ng-bind="field.raw"></td>
                    <td ng-class="preview.processedRecordChangedClass(field)" ng-bind="field.formattedProcessed"></td>
                </tr>
                <tr ng-show="processedRecord.validationMessages && (processedRecord.validationMessages.length > 0)" class="error">
                    <td colspan="3" class="error XXassertionHeader">
                        <span class="dataQualityHdr">Record Validation error</span>
                        <span class="label label-warning">Warnings {{ processedRecord.validationMessages.size() }}</span>
                    </td>
                </tr>
                <tr ng-repeat="vm in processedRecord.validationMessages">
                    <td colspan="3" class="recordValidationMsg" ng-bind="vm.message" />
                </tr>
                <tr ng-show="processedRecord.assertions" class="error">
                    <td colspan="3" class="error XXassertionHeader">
                        <span class="dataQualityHdr">Data quality tests for this record</span>
                        <span class="label label-success">Passed {{ preview.countByQaStatus(processedRecord, 1) }}</span>
                        <span class="label label-warning">Warnings {{ preview.countByQaStatus(processedRecord, 0) }}</span>
                    </td>
                </tr>
                <tr ng-repeat="assertion in processedRecord.assertions">
                    <td class="assertionName" ng-bind="assertion.name"></td>
                    <td colspan="2">
                        <span class="label"
                              ng-class="'label-' + (assertion.qaStatus == 0 ? 'primary' : assertion.qaStatus == 1 ? 'success' : assertion.qaStatus == 2 ? 'warning' : 'default')"
                              ng-bind="assertion.qaStatus == 0 ? 'warning' : assertion.qaStatus == 1 ? 'passed' : assertion.qaStatus == 2 ? 'not checked' : ''"></span>
                    </td>
                </tr>
                </tbody>
            </table>
        </uib-accordion-group>
    </uib-accordion>
</div>

<div id="jb2" style="visibility: hidden; display:none;">
    <pre ng-bind="preview.preview.headers | json"></pre>
    <pre ng-bind="preview.cachedData | json"></pre>
</div>