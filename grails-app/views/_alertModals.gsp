<%@ page contentType="text/html;charset=UTF-8" %>
<!-- Login Alert Modal -->
<script type="text/ng-template" id="notAuthenticatedModal.html">
    <div class="modal-header">
        <button type="button" class="close" ng-click="$close()" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Please login to upload data</h4>
    </div>
    <div class="modal-body">
        <p>Please login to upload your data and visual through the Atlas.</p>
        <p><a href="${hf.createLoginUrl()}">Click here</a> to login.</p>
    </div>
    <div class="modal-footer">
        <button class="btn btn-default" ng-click="$close()">Close</button>
    </div>
</script>

<!-- Not Authorised Alert Modal -->
<script type="text/ng-template" id="notAuthorisedModal.html">
    <div class="modal-header">
        <button type="button" class="close" ng-click="$close()" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">You don't have the access to upload to this sandbox</h4>
    </div>
    <div class="modal-body">
        <p>This sandbox instance has been setup for a specific group of users.</p>
        <p>If you think you should have access, please send an email to ${grailsApplication.config.skin.supportEmail}</p>
    </div>
    <div class="modal-footer">
        <button class="btn btn-default" ng-click="$close()">Close</button>
    </div>
</script>

<!-- Logged out Alert Modal -->
<script type="text/ng-template" id="loggedOut.html">
<div class="modal-header">
    <button type="button" class="close" ng-click="$close()" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    <h4 class="modal-title">Please re-login to upload data</h4>
</div>
<div class="modal-body">
    <p>You have been logged out, please log back in to continue.</p>
    <p><a target="_blank" href="${hf.createLoginUrl()}">Click here</a> to login then return to this window.</p>
</div>
<div class="modal-footer">
    <button class="btn btn-default" ng-click="$close()">Close</button>
</div>
</script>