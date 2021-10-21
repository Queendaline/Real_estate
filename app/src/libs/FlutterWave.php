<?php
/**
 *Description: ...
 *Created by: Isaac
 *Date: 1/29/2021
 *Time: 3:18 PM
 */

namespace Zikzay\libs;



define("BASEPATH", 1);

include(ROOT.DS.'vendor'.DS.'flutterwavedev'.DS.'flutterwave-v3'.DS.'library/rave.php');
include(ROOT.DS.'vendor'.DS.'flutterwavedev'.DS.'flutterwave-v3'.DS.'library/raveEventHandlerInterface.php');
use Flutterwave\Rave;
use Zikzay\core\Session;
use Zikzay\Lib\Util;

class FlutterWave
{
    private $successUrl;
    private $failureUrl;
    private $amount;
    private $url;
    private $payment;

    public function __construct()
    {
        $this->url = (isset($_SERVER['HTTPS']) ? 'https' : 'http') .
        $secreteKey = Hash::decrypt(FLUTTER_WAVE_SECRET_KEY);


        $reference = Util::reference(12);

        $this->payment = new Rave($secreteKey, $reference, true);

//        if ($this->amount) {
//            // Make payment
//
//        } else {
//            if ($getData['cancelled'] && $getData['tx_ref']) {
//                // Handle canceled payments
//
//            } elseif ($getData['tx_ref']) {
//                // Handle completed payments
//
//
//            } else {
//                $this->payment->logger->warn('Stop!!! Please pass the txref parameter!');
//                echo 'Stop!!! Please pass the txref parameter!';
//            }
//        }
    }

    public function cancelledPayment($reference) {
        $this->payment
            ->eventHandler(new FlutterWaveEventHandler)
            ->requeryTransaction($reference)
            ->paymentCanceled($reference);
    }

    public function paymentComplete($reference) {
        $this->payment->logger->notice('Payment completed. Now requerying payment.');
        $this->payment
            ->eventHandler(new FlutterWaveEventHandler)
            ->requeryTransaction($reference);
    }

    function getURL($url,$data = array()){
        $urlArr = explode('?',$url);
        $params = array_merge($_GET, $data);
        $new_query_string = http_build_query($params).'&'.$urlArr[1];
        $newUrl = $urlArr[0].'?'.$new_query_string;
        return $newUrl;
    }

    public function makePayment($amount, $description, $firstName, $lastName, $email, $phone) {
        $this->payment
            ->eventHandler(new FlutterWaveEventHandler)
            ->setAmount($amount)
            ->setPaymentOptions('card') // value can be card, account or both
            ->setDescription($description)
            ->setLogo(USER_ASSET_PATH."img/logos/logo.jpg")
            ->setTitle('MABRO')
            ->setCountry('NG')
            ->setCurrency('NGN')
            ->setEmail($email)
            ->setFirstname($firstName)
            ->setLastname($lastName)
            ->setPhoneNumber($phone)
            ->setPayButtonText("Complete Payment")
            ->setRedirectUrl($this->url)
            ->initialize();
    }
}

// This is where you set how you want to handle the transaction at different stages
