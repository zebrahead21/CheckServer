#Send mail to a fictive email address, from fictive email address
#In Chrome go to "Access for less secure apps". Set it to "Allowed".
#for this script to work. Locally it does.

import smtplib
 
content = "Server broken 1" 
email = 'name@domain.com'
password = 'smthinsecure'
to="address1@domain.com"
mail = smtplib.SMTP ("smtp.gmail.com",587) 
mail.ehlo()
mail.starttls()
mail.login(email, password)
mail.sendmail (email , email , content)
mail.close()
