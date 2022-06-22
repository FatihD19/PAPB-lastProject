<?php
// Firebase Cloud Messaging Authorization Key
define('FCM_AUTH_KEY', 'AAAAGe-Suw0:APA91bE1fM7MNaov2kzEWqDGfDf3mJISoJSrpMBTwcFZWm2nUyyO_FWcTs7fDmxAAAzdEMJD9iP-K01tjj9VyStObrTXNBCJ5A0UcQlb9QyK6NfhZlhRDk4NTugt9ObogL0cQ02K86hB');
function sendPush($to, $title, $body, $icon, $url) {
	$postdata = json_encode(
	    [
	        'notification' => 
	        	[
	        		'title' => $title,
	        		'body' => $body,
	        		'icon' => $icon,
	        		'click_action' => $url
	        	]
	        ,
	        'to' => $to
	    ]
	);
	$opts = array('http' =>
	    array(
	        'method'  => 'POST',
	        'header'  => 'Content-type: application/json'."\r\n"
	        			.'Authorization: key='.FCM_AUTH_KEY."\r\n",
	        'content' => $postdata
	    )
	);
	$context  = stream_context_create($opts);
	$result = file_get_contents('https://fcm.googleapis.com/fcm/send', false, $context);
	if($result) {
		return json_decode($result);
	} else return false;
}

sendPush($keyclient, $title, $body, $icon, $url);
// f9GUSwLmRtGi4_eCiGoMho:APA91bEA6FvRBvPv4dRDhvQnrUhiKZtdV6JocsKQOO9IW8I4iXfkiH9Qnz9ElqwMZbJCYywNolP18AMTX76U2foMAvJlp4-DJXFy6OHASwr1eH1pRpBF_7jssYdVuWl4Q6Sw6SH02WOH
?>