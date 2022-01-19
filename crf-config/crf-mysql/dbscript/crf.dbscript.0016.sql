USE crf;

UPDATE `crf`.`email_templates`
SET `message` = '<table width=\"600\" cellspacing=\"0\" border=\"0\" cellpadding=\"0\" style=\"width:100%;padding:32px 50px 32px;border-left:1px solid #e8e8e9;border-right:1px solid #e8e8e9\"><tbody><tr><td><p style=\"font-family:\'Helvetica Neue\';font-size:26px;font-weight:normal;color:#545457;margin:1em 0\">Hello ${firstName},</p></td></tr><tr><td><table cellspacing=\"0\" cellpadding=\"0\" border=\"0\" style=\"width:100%\"><tbody><tr><td><p style=\"font-family:Helvetica;font-size:16px;color:#545457;line-height:22px;margin-bottom:1.3em\">We are delighted to confirm your registration with the JMGCFinance Platform! Please note, a photo of your IDs, Proof of Address, and a photo clearly showing your face will be required by the platform for identification following the option selected. Please click on the link below.</p></td></tr><tr><td><table style=\"border: 1px solid black; width:100%; border-collapse: collapse;\"> <tbody> <tr> <th style=\"border: 1px solid black; text-align:left; padding-left:5px;\">Option 1: Copy Documents</th> <th style=\"border: 1px solid black; text-align:left; padding-left:5px;\">Option 2: Original or Certified Documents</th> </tr> <tr> <td style=\"border: 1px solid black; width: 50%; padding-left:5px; padding-top: 0px; vertical-align:top\"> <p><b>1(a) Proof of Identity (POID)</b></p> <p>A photocopy of <b>TWO</b> of the following: <ul style=\"list-style-type: \'-\';\"> <li style=\"padding-left: 1em; \">Passport</li> <li style=\"padding-left: 1em; \">Driving Licence</li> <li style=\"padding-left: 1em; \">National Identity Card</li> </ul> </p> <p>And</p> <p><b>1(b) Proof of Address (POA)</b></p> <p>A photocopy of <b>TWO</b> of the following to include your name and home address: <ul style=\"list-style-type: \'-\';\"> <li style=\"padding-left: 1em; \">Utility bill (ESB; Gas; Phone – Landline; Waste)</li> <li style=\"padding-left: 1em; \">Bank statement</li> <li style=\"padding-left: 1em; \">Tax notice from the Revenue Commissioners</li> <li style=\"padding-left: 1em; \">Social Welfare document</li> <li style=\"padding-left: 1em; \">Motor tax document</li> <li style=\"padding-left: 1em; \">Home or motor insurance certificate or renewal notice</li> </ul> </p> <p><b>Note:</b> When providing two photocopies of your POA, these documents must be from separate entities and dated within the last 6 months. </p> </td> <td style=\"border: 1px solid black; width: 50%; padding-left:5px; padding-top: 0px; vertical-align:top\"> <p><b>2(a) Proof of Identity (POID)</b></p> <p>A certified copy of <b>ONE</b> of the documents listed in Option 1(a) adjacent.</p> <p><b>Note:</b><br> A certified copy of your POID must be certified by one of the following professionals: </p> <ul style=\"list-style-type: \'-\';\"> <li style=\"padding-left: 1em; \">Garda Siochana / Police Officer</li> <li style=\"padding-left: 1em; \">Regulated financial or credit institution</li> <li style=\"padding-left: 1em; \">Practising solicitor / Notary Public</li> <li style=\"padding-left: 1em; \">Practising Chartered or Certified Public Accountant</li> <li style=\"padding-left: 1em; \">Justice of the Peace</li> <li style=\"padding-left: 1em; \">Commissioner for Oaths</li> <li style=\"padding-left: 1em; \">Embassy / Consular Staff</li> </ul> <p><b>2(b) Proof of Address (POA)</b></p> <p>An up to date (dated within the last 6 months) original or certified copy of <b>ONE</b> of the documents listed in Option 1(b) adjacent.</p> </td> </tr> </tbody></table></td></tr><tr><td><p style=\"font-family:Helvetica;font-size:16px;color:#545457;line-height:22px;margin-bottom:1.3em\">Please <a target=\"_blank\" href=\"${loginPageUrl}\"><strong>click here</strong></a> to login and upload your photos.<br></p></td></tr><tr><td><p style=\"font-family:Helvetica;font-size:16px;color:#707074;line-height:22px;margin-bottom:1em\"> Kind Regards,<br><strong>JMGCFinance Support Team</strong><br></p></td></tr></tbody></table></td></tr></tbody></table>'
WHERE (`id` = '3');