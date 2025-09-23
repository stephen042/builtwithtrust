<?php
require_once "vendor/autoload.php";
use Twilio\Rest\Client;

class twilioController
{

    public  static function sendSmsCode($number,$message_code){

		// Twilio configuration, You need to upgrade twilio account
        $sid    = "AC3102a2deef5c5796380**********"; // SID
        $token  = "e6db91560c*********c4bebcbc0"; // TOKEN
        $twilio = new Client($sid, $token);

       $message = $twilio->messages->create(
               $number, // to
                array(
                    "messagingServiceSid" => "MGc1aba905d8******951b65134074c65", // 
                    "body" => $message_code
                )
            );
// print($message->sid);
}

}

// twilioController::sendSmsCode('+2347037810014','Helll Ofofo  Developer APi');