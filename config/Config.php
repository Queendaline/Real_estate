<?php
/**
 *Description: ...
 *Created by: Isaac
 *Date: 7/23/2020
 *Time: 5:21 PM
 */

namespace Zikzay\Config;

class Config
{
    public static function inc(){

    }

}


function setForgottenDictionary()
{
    $lang = array();

    $lang['user_blocked'] = "You are currently locked out of the system.";
    $lang['user_verify_failed'] = "Captcha Code was invalid.";

    //new
    $lang['account_email_invalid']  = "Email address is incorrect or banned";

    //new
    $lang['account_password_invalid'] = "Password is invalid";

    //new
    $lang['account_not_found']          = "Account with given email not found.";


    $lang['login_remember_me_invalid'] = "The remember me field is invalid.";

    $lang['email_password_invalid'] = "Email address / password are invalid.";
    $lang['email_password_incorrect'] = "Password are incorrect for given EMail.";
    $lang['remember_me_invalid'] = "The remember me field is invalid.";

    $lang['password_short'] = "Password is too short.";
    $lang['password_weak'] = "Password is too weak.";
    $lang['password_nomatch'] = "Passwords do not match.";
    $lang['password_changed'] = "Password changed successfully.";
    $lang['password_incorrect'] = "Current password is incorrect.";
    $lang['password_notvalid'] = "Password is invalid.";

    $lang['newpassword_short'] = "New password is too short.";
    $lang['newpassword_long'] = "New password is too long.";
    $lang['newpassword_invalid'] = "New password must contain at least one uppercase and lowercase character, and at least one digit.";
    $lang['newpassword_nomatch'] = "New passwords do not match.";
    $lang['newpassword_match'] = "New password is the same as the old password.";

    $lang['email_short'] = "Email address is too short.";
    $lang['email_long'] = "Email address is too long.";
    $lang['email_invalid'] = "It is not a correct Email address.";
    $lang['email_incorrect'] = "Email address is incorrect.";
    $lang['email_banned'] = "This email address is not allowed.";
    $lang['email_changed'] = "Email address changed successfully.";

    $lang['newemail_match'] = "New email matches previous email.";

    $lang['account_inactive'] = "Account has not yet been activated.";
    $lang['account_activated'] = "Account activated.";

    $lang['logged_in'] = "You are now logged in.";
    $lang['logged_out'] = "You are now logged out.";

    $lang['system_error'] = "A system error has been encountered. Please try again.";

    $lang['register_success'] = "Account created. Activation email sent to email.";
    $lang['register_success_emailmessage_suppressed'] = "Account created.";
    $lang['email_taken'] = "The email address is already in use.";

    $lang['resetkey_invalid'] = "Reset key is invalid.";
    $lang['resetkey_incorrect'] = "Reset key is incorrect.";
    $lang['resetkey_expired'] = "Reset key has expired.";
    $lang['password_reset'] = "Password reset successfully.";

    $lang['activationkey_invalid'] = "Activation key is invalid.";
    $lang['activationkey_incorrect'] = "Activation key is incorrect.";
    $lang['activationkey_expired'] = "Activation key has expired.";

    $lang['reset_requested'] = "Password reset request sent to email address.";
    $lang['reset_requested_emailmessage_suppressed'] = "Password reset request is created.";
    $lang['reset_exists'] = "A reset request already exists.";

    $lang['already_activated'] = "Account is already activated.";
    $lang['activation_sent'] = "Activation email has been sent.";
    $lang['activation_exists'] = "An activation email has already been sent.";

    $lang['email_activation_subject'] = '%s - Activate account';
    $lang['email_activation_body'] = 'Hello,<br/><br/> To be able to log in to your account you first need to activate your account by clicking on the following link : <strong><a href="%1$s/%2$s">%1$s/%2$s</a></strong><br/><br/> You then need to use the following activation key: <strong>%3$s</strong><br/><br/> If you did not sign up on %1$s recently then this message was sent in error, please ignore it.';
    $lang['email_activation_altbody'] = 'Hello, ' . "\n\n" . 'To be able to log in to your account you first need to activate your account by visiting the following link :' . "\n" . '%1$s/%2$s' . "\n\n" . 'You then need to use the following activation key: %3$s' . "\n\n" . 'If you did not sign up on %1$s recently then this message was sent in error, please ignore it.';

    $lang['email_reset_subject'] = '%s - Password reset request';
    $lang['email_reset_body'] = 'Hello,<br/><br/>To reset your password click the following link :<br/><br/><strong><a href="%1$s/%2$s">%1$s/%2$s</a></strong><br/><br/>You then need to use the following password reset key: <strong>%3$s</strong><br/><br/>If you did not request a password reset key on %1$s recently then this message was sent in error, please ignore it.';
    $lang['email_reset_altbody'] = 'Hello, ' . "\n\n" . 'To reset your password please visiting the following link :' . "\n" . '%1$s/%2$s' . "\n\n" . 'You then need to use the following password reset key: %3$s' . "\n\n" . 'If you did not request a password reset key on %1$s recently then this message was sent in error, please ignore it.';

    $lang['account_deleted'] = "Account deleted successfully.";
    $lang['function_disabled'] = "This function has been disabled.";

    return $lang;
}
/**
 * DROP TABLE phpauth_config;
CREATE TABLE phpauth_config (
setting varchar(100) NOT NULL,
value varchar(100) DEFAULT NULL,
PRIMARY KEY (setting)
);

INSERT INTO phpauth_config (setting, value) VALUES ('attack_mitigation_time',  '+30 minutes');
INSERT INTO phpauth_config (setting, value) VALUES ('attempts_before_ban', '30');
INSERT INTO phpauth_config (setting, value) VALUES ('attempts_before_verify',  '5');
INSERT INTO phpauth_config (setting, value) VALUES ('bcrypt_cost', '10');
INSERT INTO phpauth_config (setting, value) VALUES ('cookie_domain', NULL);
INSERT INTO phpauth_config (setting, value) VALUES ('cookie_forget', '+30 minutes');
INSERT INTO phpauth_config (setting, value) VALUES ('cookie_http', '0');
INSERT INTO phpauth_config (setting, value) VALUES ('cookie_name', 'phpauth_session_cookie');
INSERT INTO phpauth_config (setting, value) VALUES ('cookie_path', '/');
INSERT INTO phpauth_config (setting, value) VALUES ('cookie_remember', '+1 month');
INSERT INTO phpauth_config (setting, value) VALUES ('cookie_secure', '0');
INSERT INTO phpauth_config (setting, value) VALUES ('cookie_renew', '+5 minutes');
INSERT INTO phpauth_config (setting, value) VALUES ('allow_concurrent_sessions', FALSE);
INSERT INTO phpauth_config (setting, value) VALUES ('emailmessage_suppress_activation',  '0');
INSERT INTO phpauth_config (setting, value) VALUES ('emailmessage_suppress_reset', '0');
INSERT INTO phpauth_config (setting, value) VALUES ('mail_charset','UTF-8');
INSERT INTO phpauth_config (setting, value) VALUES ('password_min_score',  '3');
INSERT INTO phpauth_config (setting, value) VALUES ('site_activation_page',  'activate');
INSERT INTO phpauth_config (setting, value) VALUES ('site_email',  'no-reply@example.com');
INSERT INTO phpauth_config (setting, value) VALUES ('site_key',  'fghuior.)/!/jdUkd8s2!7HVHG7777ghg');
INSERT INTO phpauth_config (setting, value) VALUES ('site_name', 'PHPAuth');
INSERT INTO phpauth_config (setting, value) VALUES ('site_password_reset_page',  'reset');
INSERT INTO phpauth_config (setting, value) VALUES ('site_timezone', 'Europe/Paris');
INSERT INTO phpauth_config (setting, value) VALUES ('site_url',  'https://github.com/PHPAuth/PHPAuth');
INSERT INTO phpauth_config (setting, value) VALUES ('site_language', 'en_GB'),
INSERT INTO phpauth_config (setting, value) VALUES ('smtp',  '1');
INSERT INTO phpauth_config (setting, value) VALUES ('smtp_auth', '0');
INSERT INTO phpauth_config (setting, value) VALUES ('smtp_host', 'smtp.example.com');
INSERT INTO phpauth_config (setting, value) VALUES ('smtp_password', 'password');
INSERT INTO phpauth_config (setting, value) VALUES ('smtp_port', '25');
INSERT INTO phpauth_config (setting, value) VALUES ('smtp_security', NULL);
INSERT INTO phpauth_config (setting, value) VALUES ('smtp_username', 'email@example.com');
INSERT INTO phpauth_config (setting, value) VALUES ('table_attempts',  'phpauth_attempts');
INSERT INTO phpauth_config (setting, value) VALUES ('table_requests',  'phpauth_requests');
INSERT INTO phpauth_config (setting, value) VALUES ('table_sessions',  'phpauth_sessions');
INSERT INTO phpauth_config (setting, value) VALUES ('table_users', 'phpauth_users');
INSERT INTO phpauth_config (setting, value) VALUES ('table_emails_banned', 'phpauth_emails_banned');
INSERT INTO phpauth_config (setting, value) VALUES ('table_translations', 'phpauth_translation_dictionary'),
INSERT INTO phpauth_config (setting, value) VALUES ('verify_email_max_length', '100');
INSERT INTO phpauth_config (setting, value) VALUES ('verify_email_min_length', '5');
INSERT INTO phpauth_config (setting, value) VALUES ('verify_email_use_banlist',  '1');
INSERT INTO phpauth_config (setting, value) VALUES ('verify_password_min_length',  '3');
INSERT INTO phpauth_config (setting, value) VALUES ('request_key_expiration', '+10 minutes');
INSERT INTO phpauth_config (setting, value) VALUES ('translation_source', 'php');
INSERT INTO phpauth_config (setting, value) VALUES ('recaptcha_enabled', 0);
INSERT INTO phpauth_config (setting, value) VALUES ('recaptcha_site_key', '');
INSERT INTO phpauth_config (setting, value) VALUES ('recaptcha_secret_key', 'php');

DROP TABLE phpauth_attempts;
CREATE TABLE phpauth_attempts (
id SERIAL,
ip varchar(39) NOT NULL,
expiredate DATETIME YEAR TO SECOND,
PRIMARY KEY (id)
);

DROP TABLE phpauth_requests;
CREATE TABLE phpauth_requests (
id SERIAL,
uid integer NOT NULL,
token varchar(20) NOT NULL,
expire DATETIME YEAR TO SECOND,
type varchar(20) NOT NULL,
PRIMARY KEY (id)
);

DROP TABLE phpauth_sessions;
CREATE TABLE phpauth_sessions (
id SERIAL,
uid integer NOT NULL,
hash varchar(40) NOT NULL,
expiredate DATETIME YEAR TO SECOND,
ip varchar(39) NOT NULL,
agent varchar(200) NOT NULL,
cookie_crc char(40) NOT NULL,
PRIMARY KEY (id)
);

DROP TABLE phpauth_users;
CREATE TABLE phpauth_users (
id SERIAL,
email varchar(100) DEFAULT NULL,
password varchar(255) DEFAULT NULL,
isactive smallint DEFAULT 0 NOT NULL,
dt DATETIME YEAR TO SECOND DEFAULT CURRENT YEAR TO SECOND,
PRIMARY KEY (id)
);

DROP TABLE phpauth_emails_banned;
CREATE TABLE phpauth_emails_banned (
id serial NOT NULL,
domain character varying(100) DEFAULT NULL,
PRIMARY KEY (id)
);
 */