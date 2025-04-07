/*
|--------------------------------------------------------------------------
| WHMCS Client Area - Hide Reply Button on Closed Ticket
|--------------------------------------------------------------------------
| This hook will check if the ticket status is 'Closed'.
| If the ticket is closed, it will remove the "Reply" button from the ticket via the template file
| This remobed the Reply Banner and the Reply Button on the viewticket.php screen in the client area to prevent the user from reopening the ticket. 
| The viewticket.tpl also needs to be updated as done the LANG file
|
| — Enterrahost
*/

<?php
use WHMCS\Database\Capsule;

function check_ticket_status_hook($vars) {
    $userId = isset($_SESSION['uid']) ? $_SESSION['uid'] : null;
    
    // Only proceed if we're on the viewticket page
    if (strpos($vars['templatefile'], 'viewticket') !== false && isset($_GET['tid'])) {
        $ticketTID = $_GET['tid'];

        $ticket = Capsule::table('tbltickets')
            ->select('id', 'tid', 'title', 'status')
            ->where('tid', '=', $ticketTID)
            ->first();

        if ($ticket) {
            // Add ticket status to Smarty template variables
            return [
                'ticket_status' => $ticket->status,
                'ticket_closed' => ($ticket->status == 'Closed'),
                'additionalCSS' => ($ticket->status == 'Closed') ? 
                    '.btn-success[onclick*="ticketReply"] { display: none !important; }' : ''
            ];
        }
    }
    return [];
}

add_hook('ClientAreaPage', 1, 'check_ticket_status_hook');
