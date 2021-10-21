<?php
/**
 *Description: ...
 *Created by: Isaac
 *Date: 8/5/2020
 *Time: 1:22 PM
 */
const
most_be_blank = "%s must not be left blank",
is_not_number_error = "%s must be a number",
is_not_string_error = "%s must contain only alpha numeric characters",
is_not_date_error = "%s must be a date",
is_not_datetime_error = "%s must must a date and time",
is_not_year_error = "%s must be a year",
is_not_time_error = "%s must be a time",
is_not_phone_error = "Enter a valid %s",
is_not_email_error = "Enter a valid %s",
is_not_name_error = "%s must contain only alphas",
is_not_username_error = "%s must contain only alpha numeric and underscore characters",
is_not_unique_error = "%s already exist",
is_blank_error = "%s is required",
is_too_short_error = "%s must not be shorter than ",
is_too_long_error = "%s must not be longer than ",

user_blocked = "You are currently locked out of the system.",
user_verify_failed = "Captcha Code was invalid.",

account_email_invalid  = "Email address is incorrect or banned",


account_password_invalid = "Password is invalid",


account_not_found          = "Account with given email not found.",


login_remember_me_invalid = "The remember me field is invalid.",

email_password_invalid = "Email address / password are invalid.",
email_password_incorrect = "Password are incorrect for given EMail.",
remember_me_invalid = "The remember me field is invalid.",

password_short = "Password is too short.",
password_weak = "Password is too weak.",
password_nomatch = "Passwords do not match.",
password_changed = "Password changed successfully.",
password_incorrect = "Current password is incorrect.",
password_notvalid = "Password is invalid.",

newpassword_short = "New password is too short.",
newpassword_long = "New password is too long.",
newpassword_invalid = "New password must contain at least one uppercase and lowercase character, and at least one digit.",
newpassword_nomatch = "New passwords do not match.",
newpassword_match = "New password is the same as the old password.",

email_short = "Email address is too short.",
email_long = "Email address is too long.",
email_invalid = "It is not a correct Email address.",
email_incorrect = "Email address is incorrect.",
email_banned = "This email address is not allowed.",
email_changed = "Email address changed successfully.",

newemail_match = "New email matches previous email.",

account_inactive = "Account has not yet been activated.",
account_activated = "Account activated.",

logged_in = "You are now logged in.",
logged_out = "You are now logged out.",

system_error = "A system error has been encountered. Please try again.",

register_success = "Account created. Activation email sent to email.",
register_success_emailmessage_suppressed = "Account created.",
email_taken = "The email address is already in use.",

resetkey_invalid = "Reset key is invalid.",
resetkey_incorrect = "Reset key is incorrect.",
resetkey_expired = "Reset key has expired.",
password_reset = "Password reset successfully.",

activationkey_invalid = "Activation key is invalid.",
activationkey_incorrect = "Activation key is incorrect.",
activationkey_expired = "Activation key has expired.",

reset_requested = "Password reset request sent to email address.",
reset_requested_emailmessage_suppressed = "Password reset request is created.",
reset_exists = "A reset request already exists.",

already_activated = "Account is already activated.",
activation_sent = "Activation email has been sent.",
activation_exists = "An activation email has already been sent.",

email_activation_subject = '%s - Activate account',
email_activation_body = 'Hello,<br/><br/> To be able to log in to your account you first need to activate your account by clicking on the following link : <strong><a href="%1$s/%2$s">%1$s/%2$s</a></strong><br/><br/> You then need to use the following activation key: <strong>%3$s</strong><br/><br/> If you did not sign up on %1$s recently then this message was sent in error, please ignore it.',
email_activation_altbody = 'Hello, ' . "\n\n" . 'To be able to log in to your account you first need to activate your account by visiting the following link :' . "\n" . '%1$s/%2$s' . "\n\n" . 'You then need to use the following activation key: %3$s' . "\n\n" . 'If you did not sign up on %1$s recently then this message was sent in error, please ignore it.',

email_reset_subject = '%s - Password reset request',
email_reset_body = 'Hello,<br/><br/>To reset your password click the following link :<br/><br/><strong><a href="%1$s/%2$s">%1$s/%2$s</a></strong><br/><br/>You then need to use the following password reset key: <strong>%3$s</strong><br/><br/>If you did not request a password reset key on %1$s recently then this message was sent in error, please ignore it.',
email_reset_altbody = 'Hello, ' . "\n\n" . 'To reset your password please visiting the following link :' . "\n" . '%1$s/%2$s' . "\n\n" . 'You then need to use the following password reset key: %3$s' . "\n\n" . 'If you did not request a password reset key on %1$s recently then this message was sent in error, please ignore it.',

account_deleted = "Account deleted successfully.",
function_disabled = "This function has been disabled.",
    
AMENITIES = [
    'Air Conditioning',
    'Swimming Pool',
    'Gym',
    'Electricity',
    'Curtains',
    'Refridgerator',
    'TV Cable',
    'Wifi',
    'Water Supply',
],    





error = 'Error';
;