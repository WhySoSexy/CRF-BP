USE crf;

ALTER TABLE `crf`.`deposit_accounts` 
ADD COLUMN `account_number` VARCHAR(8) NOT NULL AFTER `deposit_product_id`;

UPDATE `crf`.`email_templates` SET `message` = '<table width=\"600\" cellspacing=\"0\" border=\"0\" cellpadding=\"0\" style=\"width:100%;padding:32px 50px 32px;border-left:1px solid #e8e8e9;border-right:1px solid #e8e8e9\"><tbody><tr><td><p style=\"font-family:\'Helvetica Neue\';font-size:26px;font-weight:400;color:#545457;margin:1em 0\">Hello ${firstName},</p></td></tr><tr><td><table cellspacing=\"0\" cellpadding=\"0\" border=\"0\" style=\"width:100%\"><tbody><tr><td><p style=\"font-family:Helvetica;font-size:16px;color:#545457;line-height:22px;margin-bottom:1.3em\">You have successfully added a deposit product to your account. Please check the product details in the table below.<br>${productDetailsTable}</p></td></tr><tr><td><p style=\"font-family:Helvetica;font-size:12px;color:#545457;line-height:22px;margin-bottom:1.3em\">* Indicates the start of the term. Please note, the actual term will start from the date the deposit is received.<br>** Indicates the end of the term. It is based on the start date plus the term (years).</p></td></tr><tr><td><p style=\"font-family:Helvetica;font-size:16px;color:#545457;line-height:22px;margin-bottom:1.3em\">Please note, the status of your deposit product will remain as INITIATED until your deposit is confirmed that it has been received on the bank account below. Once that is confirmed, you will receive a confirmation email. The interest earnings will begin from the date of confirmation and the maturity date will be set accordingly.</p></td></tr><tr><td><p style=\"font-family:Helvetica;font-size:16px;color:#545457;line-height:22px;margin-bottom:1.3em\">${bankDetailsTable}</p></td></tr><tr><td><p style=\"font-family:Helvetica;font-size:16px;color:#545457;line-height:22px;margin-bottom:1.3em\">Please <a target=\"_blank\" href=\"${loginPageUrl}\"><strong>click here</strong></a> to login and manage your deposits.<br></p></td></tr><tr><td><p style=\"font-family:Helvetica;font-size:16px;color:#707074;line-height:22px;margin-bottom:1em\">Kind Regards,<br><strong>JMGCFinance Support Team</strong><br></p></td></tr></tbody></table></td></tr></tbody></table>' WHERE (`id` = '7');