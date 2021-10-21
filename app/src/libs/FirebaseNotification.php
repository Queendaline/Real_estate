<?php
/**
 *Description: ...
 *Created by: Isaac
 *Date: 2/28/2021
 *Time: 8:53 PM
 */

namespace Zikzay\libs;


use Kreait\Firebase\Factory;
use Kreait\Firebase\Messaging\CloudMessage;
use Kreait\Firebase\Messaging\Notification;

class FirebaseNotification
{
    public $time, $title, $body;
    public $messaging;
    public $message;
    public $image_url = 'https://oragox.com/images/icons/notification_white.png';

    private function __construct(){

        $factory = (new Factory)->withServiceAccount(__DIR__ . '/secret/oragox-58cca-373baa156a2a.json');
        $this->messaging = $factory->createMessaging();
    }

    public static function sendToTopic($topic, $title, $body, $data = null) {
        $new = new self();
        $new->notification($title, $body, 'topic', $topic, $data);
    }

    public static function sendToDevice($token, $title, $body, $data = null) {
        $new = new self();
        $new->notification($title, $body, 'token', $token, $data);
    }

    private function send(){
        try {
            return $this->messaging->send($this->message);

        } catch (\Kreait\Firebase\Exception\MessagingException $e) {
            $e->getMessage();

        } catch (\Kreait\Firebase\Exception\FirebaseException $e) {
            $e->getMessage();
        }
        return null;
    }


    private function notification($title, $body, $type,$typeValue,  $data = null){
        if($data != null) {
            $this->message = CloudMessage::withTarget($type, $typeValue)
                ->withNotification(Notification::create($title, $body, $this->image_url))
                ->withData($data);

        }else if($data == null){
            $this->message = CloudMessage::withTarget($type, $typeValue)
                ->withNotification(Notification::create($title, $body, $this->image_url));
        }
        return $this->send();
    }

    private function notification_array($type, $typeValue, $notification = null, $data = null){
        if($data == null) {
            $this->message = CloudMessage::withTarget($type, $typeValue)
                ->withNotification($notification)
                ->withData($data);

        }else if($notification == null) {
            $this->message = CloudMessage::withTarget($type, $typeValue)
                ->withNotification($notification)
                ->withData($data);

        }else if($notification != null and $data != null) {
            $this->message = CloudMessage::withTarget($type, $typeValue)
                ->withNotification($notification)
                ->withData($data);
        }

        $this->send();
    }



    public function notification_multiply_device(){

    }


    public function register_device_token(){

    }

    public function subscribe_to_topic(){
        $topic = 'my-topic';
        $registrationTokens = [

        ];

        try {
            $this->messaging->subscribeToTopic($topic, $registrationTokens);

        } catch (\Kreait\Firebase\Exception\MessagingException $e) {

        } catch (\Kreait\Firebase\Exception\FirebaseException $e) {
            //            $this->messaging->s
        }
    }

}