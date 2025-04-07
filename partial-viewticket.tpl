/*
|--------------------------------------------------------------------------
| WHMCS Client Area - View Template
|--------------------------------------------------------------------------
| The hook will check if the ticket status is 'Closed' and then hide the Reply banner, and the Reply Button
| Find your themes viewticket.tpl /templates/MYTHEME/viewticket.tpl and make a backup. 
| then edit viewticket.tpl and find "{if !$invalidTicketId}" (about line 13) then replace all the test to about like 69 the closing </div> for this section,
| the closing div is above "<div class="panel panel-info visible-print-block">"
| The LANG file in /lang/(overides)/english.php should be updated too, you can search for "This ticket is closed. ...." 
| You can change the text to something like "$_LANG['supportticketclosedmsg'] = "This ticket is closed.  Please Log a New Ticket if Needed.";
|
| — Enterrahost
*/

### viewticket.tpl Only add from Below here ####

{* Added CSS to Hide the Reply button this goes hear the top of the file below around line 11 below the initial "{if sections" *}
{if $additionalCSS}
    <style>{$additionalCSS}</style>
{/if}

{* START Replaced Code in this Div section to disable the Reply to reopen ticket *}

{if !$invalidTicketId}
    {if !$ticket_closed && !$closedticket}
    <div class="panel panel-info panel-collapsable{if !$postingReply} panel-collapsed{/if} hidden-print">
        <div class="panel-heading" id="ticketReply">
            <div class="collapse-icon pull-right">
                <i class="fas fa-{if !$postingreply}plus{else}minus{/if}"></i>
            </div>
            <h3 class="panel-title">
                <i class="fas fa-pencil-alt"></i> &nbsp; {$LANG.supportticketsreply}
            </h3>
        </div>
        <div class="panel-body{if !$postingReply} panel-body-collapsed{/if}">

            <form method="post" action="{$smarty.server.PHP_SELF}?tid={$tid}&amp;c={$c}&amp;postreply=true" enctype="multipart/form-data" role="form" id="frmReply">

                <div class="row">
                    <div class="form-group col-sm-4">
                        <label for="inputName">{$LANG.supportticketsclientname}</label>
                        <input class="form-control" type="text" name="replyname" id="inputName" value="{$replyname}"{if $loggedin} disabled="disabled"{/if}>
                    </div>
                    <div class="form-group col-sm-5">
                        <label for="inputEmail">{$LANG.supportticketsclientemail}</label>
                        <input class="form-control" type="text" name="replyemail" id="inputEmail" value="{$replyemail}"{if $loggedin} disabled="disabled"{/if}>
                    </div>
                </div>

                <div class="form-group">
                    <label for="inputMessage">{$LANG.contactmessage}</label>
                    <textarea name="replymessage" id="inputMessage" rows="12" class="form-control markdown-editor" data-auto-save-name="ctr{$tid}">{$replymessage}</textarea>
                </div>

                <div class="row form-group">
                    <div class="col-sm-12">
                        <label for="inputAttachments">{$LANG.supportticketsticketattachments}</label>
                    </div>
                    <div class="col-sm-9">
                        <input type="file" name="attachments[]" id="inputAttachments" class="form-control" />
                        <div id="fileUploadsContainer"></div>
                    </div>
                    <div class="col-sm-3">
                        <button type="button" class="btn btn-default btn-block" onclick="extraTicketAttachment()">
                            <i class="fas fa-plus"></i> {$LANG.addmore}
                        </button>
                    </div>
                    <div class="col-xs-12 ticket-attachments-message text-muted">
                        {$LANG.supportticketsallowedextensions}: {$allowedfiletypes} ({lang key="maxFileSize" fileSize="$uploadMaxFileSize"})
                    </div>
                </div>

                <div class="form-group text-center">
                    <input class="btn btn-primary" type="submit" name="save" value="{$LANG.supportticketsticketsubmit}" />
                    <input class="btn btn-default" type="reset" value="{$LANG.cancel}" onclick="jQuery('#ticketReply').click()" />
                </div>

            </form>

        </div>
    </div>
    {/if}
    
{* END Replaced Code in this Div section to disable the Reply to reopen ticket *}
      
