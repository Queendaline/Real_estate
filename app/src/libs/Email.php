<?php
/**
 *Description: ...
 *Created by: Isaac
 *Date: 8/8/2020
 *Time: 3:40 PM
 */

namespace Zikzay\libs\mail;


use PHPMailer\PHPMailer\Exception;
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use Zikzay\libs\Hash;

class Email extends PHPMailer
{
    private static $attachments;

    public function __construct($name)
    {
        parent::__construct(true);
        $this->settings($name);
    }

    private function settings($name)
    {
        date_default_timezone_set('Etc/UTC');
        $this->SMTPDebug = SMTP::DEBUG_OFF; // Enable verbose debug output
        $this->isSMTP();
        $this->Host = 'swizel';
        $this->Hostname = 'localhost.localdomain';
        $this->SMTPAuth = true;
        $this->Priority = 1;
        $this->Username = Hash::decrypt(EMAIL_ID);
        $this->Password = Hash::decrypt(EMAIL_PASSWORD);
        $this->SMTPSecure = PHPMailer::ENCRYPTION_SMTPS;
        $this->Port = 465;

        try {
            $this->setFrom($this->Username, $name);
        } catch (Exception $e) {

        }
    }

    private function prepare($to, $subject, $message, $cc = null, $bcc = null)
    {
        $this->Subject = $subject;
        $this->Body = $message;
        $this->AltBody = $message;
        try {
            $this->sendTo($to);
            if($cc) $this->addCC($cc);
            if($bcc) $this->addBCC($bcc);
            return parent::send();
        } catch (Exception $e) {
            return false;
        }
    }

    public static function message($to, $subject, $message, $name = null, $cc = null, $bcc = null)
    {
        $self = new self($name);
        $self->getAttachment(self::$attachments);
        return $self->prepare($to, $subject, $message, $cc, $bcc);
    }

    public static function attachments($file, $fileName = null)
    {
        self::$attachments[] = ['file' => $file, 'fileName' => $fileName];
    }

    /**
     * @param $to
     * @throws Exception
     */
    private function sendTo($to)
    {

        if(is_array($to)){
            foreach ($to as $name => $email) {
                $this->addAddress($email, $name);
                $this->addReplyTo($email, $name);
            }
        }else {
            $this->addAddress($this->Username);
            $this->addAddress($to);
            $this->addReplyTo($to);
        }
    }

    private function getAttachment($attachments) {
        if(isset($attachments[0])) {
            foreach ($attachments as $attachment) {
                try {
                    $this->addAttachment($attachment['file'], $attachment['fileName']);
                } catch (Exception $e) {
                }
            }
        }
    }

    public static function register($email, $code) {
        $hashCode = str_replace('/', '`', Hash::encrypt($code));
        $hashEmail = str_replace('/', '`', Hash::encrypt($email));
        $url = "https://mabro.ng/account/email-verification?user={$hashEmail}&token={$hashCode}";
        ob_start();
        require_once VIEWS_PATH."/email/welcome.php";
        require_once VIEWS_PATH."/email/base.php";
        $message = ob_get_clean();
        self::message($email, 'Account Registration', $message);
    }
}


