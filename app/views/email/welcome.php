<?php
/**
 *Description: ...
 *Created by: Isaac
 *Date: 4/3/2021
 *Time: 2:43 AM
 */
ob_start();
?>

<table class="column" role="presentation" align="center" width="100%" cellspacing="0" cellpadding="0" border="0" style="vertical-align: top;-webkit-text-size-adjust: 100%;-ms-text-size-adjust: 100%;mso-table-lspace: 0pt;mso-table-rspace: 0pt;">
    <tbody>
    <tr>
        <td class="column_cell px py_md text_dark text_center" data-color="Dark" style="vertical-align: top;color: #333333;text-align: center;padding-top: 32px;padding-bottom: 32px;padding-left: 16px;padding-right: 16px;-webkit-text-size-adjust: 100%;-ms-text-size-adjust: 100%;mso-table-lspace: 0pt;mso-table-rspace: 0pt;">
            <h2 class="mt_md mb_xs" style="color: inherit;font-family: Arial, Helvetica, sans-serif;margin-top: 32px;margin-bottom: 8px;word-break: break-word;font-size: 28px;line-height: 38px;font-weight: bold;">Welcome to Mabro</h2>
            <p class="text_lead text_secondary mb_md" data-color="Secondary" style="color: #959ba0;font-family: Arial, Helvetica, sans-serif;margin-top: 0px;margin-bottom: 32px;word-break: break-word;font-size: 16px;line-height: 24px;">
                Your registration with Mabro system was successful. We are really glad to have ou join us and cannot wait to help make your transaction experience easy
            </p>
            <p class="text_lead text_secondary mb_md" data-color="Secondary" style="color: #7a7a7a;font-family: Arial, Helvetica, sans-serif;margin-top: 0px;margin-bottom: 0px;word-break: break-word;font-size: 16px;line-height: 24px;">
                To get started, please verify your registration, click the button below or copy and paste this url into your browser address bar.
            </p>
            <p style="color: #7a7a7a;font-family: Arial, Helvetica, sans-serif;margin-top: 0px;margin-bottom: 32px;word-break: break-word;font-size: 12px;line-height: 16px;">
                <a href="<?=$url?>" style="color: darkred; font-size: 12px; line-height: 16px"><?=$url?></a></p>
            <table role="presentation" class="ebutton" align="center" border="0" cellspacing="0" cellpadding="0" style="-webkit-text-size-adjust: 100%;-ms-text-size-adjust: 100%;mso-table-lspace: 0pt;mso-table-rspace: 0pt;margin: 0 auto;">
                <tbody>
                <tr>
                    <td class="bg_primary" data-bgcolor="Primary" style="background-color: #2376dc;-webkit-text-size-adjust: 100%;-ms-text-size-adjust: 100%;mso-table-lspace: 0pt;mso-table-rspace: 0pt;font-size: 16px;padding: 13px 24px;border-radius: 4px;line-height: normal;text-align: center;font-weight: bold;-webkit-transition: box-shadow .25s;transition: box-shadow .25s;">
                        <a href="<?=$url?>" data-color="White" style="-webkit-text-size-adjust: 100%;-ms-text-size-adjust: 100%;text-decoration: none;color: #ffffff;font-family: Arial, Helvetica, sans-serif;margin-top: 0px;margin-bottom: 0px;word-break: break-word;font-weight: bold;">
                            <span data-color="White" style="color: #ffffff;text-decoration: none;">Verify Email</span></a></td>
                </tr>
                </tbody>
            </table>

            <p class="text_lead text_secondary mb_md" data-color="Secondary" style="color: #7a7a7a;font-family: Arial, Helvetica, sans-serif;margin-top: 24px;margin-bottom: 32px;word-break: break-word;font-size: 16px;line-height: 31px;">
                You can also use this verification code <br>
                <span style="font-size: 24px; color: #222222; font-weight: 700;"><?=$code?></span><br>
                on your email verification page at
                <a href="https://mabro.ng" style="color: darkred">mabro.ng</a>
            </p>
<!--            <p class="mt_md mb_md" style="color: inherit;font-family: Arial, Helvetica, sans-serif;margin-top: 32px;margin-bottom: 32px;word-break: break-word;font-size: 16px;line-height: 26px;">Untactfully hare bitterly wow insincerely terrier went close inarticulately this began hurriedly ouch zebra fish and much inside considering.</p>-->
        </td>
    </tr>
    </tbody>
</table>
<?php
$content = ob_get_clean();
