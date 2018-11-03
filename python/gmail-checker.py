#!/usr/bin/env python

import imaplib
import os
import subprocess
import time

obj = imaplib.IMAP4_SSL('imap.gmail.com')
obj.login(os.environ['gmail_username'], os.environ['gmail_password'])
obj.select()
mail_count = len(obj.search(None, 'UnSeen')[1][0].split())

if mail_count != 0:
    mail_string = ''
    if mail_count > 1:
        mail_string = ' new mails'
    else:
        mail_string = ' new mail'

    mail_string = f"{mail_count}{mail_string}"

    subprocess.run(["xsetroot", "-name", mail_string])
    time.sleep(10)
