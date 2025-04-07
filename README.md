# WHMCS-Remove-Reply-Button-from-Closed-Ticket
This hook and template modification hides the "Reply" button in the WHMCS client area when a support ticket is closed.
WHMCS Ticket Reply Visibility Control

This hook and template modification hides the "Reply" button in the WHMCS client area when a support ticket is closed.

Key Features:

 Conditional Rendering: Uses Session ID and API calls to find the ticket ID from the TID tring in the URL.
 Server-Side Check: Ensures closed tickets cannot be replied to (avoids JS/CSS workarounds) uses css.
 Multilingual Support: Uses WHMCS language strings (e.g., $_LANG['supportticketclosedmsg'] in

Files Modified:

viewticket.tpl (Template)
lang/english.php (you should use lang/overrides/english.php or your prefered language
Add Custom hook DisableReplyClosed.php
Use Case:

Prevents users from attempting to reply to closed tickets, improving UX and reducing support confusion.

Closed Tickets Stay Closed unless reopened by an Admin (be sure to also using the "Prevent Email Reopening" in Settings / Support via the admin screen.

- Enterrahost
