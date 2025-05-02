/*
|--------------------------------------------------------------------------
| WHMCS Client Area - View Template
|--------------------------------------------------------------------------
| The hook will check if the ticket status is 'Closed' and then hide the Reply banner, and the Reply Button, as well as the Ticket Reply Container
| Find your themes viewticket.tpl /templates/MYTHEME/viewticket.tpl and make a backup. 
| then edit viewticket.tpl and find "{if !$invalidTicketId}" (about line 13) then replace all the text to about line 47 the closing </div> for this section,
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
    <div class="card view-ticket">
        <div class="card-body p-3">
            <h3 class="card-title">
                {lang key='supportticketsviewticket'} #{$tid}
                <div class="ticket-actions float-sm-right mt-3 mt-sm-0">
                    {if !$ticket_closed && !$closedticket}
                    <button id="ticketReply" type="button" class="btn btn-default btn-sm" onclick="smoothScroll('#ticketReplyContainer')">
                        <i class="fas fa-pencil-alt fa-fw"></i>
                        {lang key='supportticketsreply'}
                    </button>
                    {/if}
                    {if $closedticket}
                        <button class="btn btn-danger btn-sm" disabled="disabled">
                            <i class="fas fa-times fa-fw"></i>
                            {lang key='supportticketsstatusclosed'}
                        </button>
                    {else}
                        <button class="btn btn-danger btn-sm" onclick="window.location='?tid={$tid}&amp;c={$c}&amp;closeticket=true'">
                            <i class="fas fa-times fa-fw"></i>
                            {lang key='supportticketsclose'}
                        </button>
                    {/if}
                </div>
            </h3>

            <p>
                {lang key='supportticketssubject'}:
                <strong>{$subject}</strong>
            </p>
        </div>

{* END Replaced Code in this Div section to disable the Reply to reopen ticket *}
