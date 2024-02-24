import yagmail
import json

institution_lookup = json.load(open("./data/institutions.json"))
print(institution_lookup)
gamil_id = "mail id"
gamil_password = "paswd" # if mail as 2FA then get the "App password" in the 2FA settings.

institution = str(input("Enter Institution Name:").rstrip())
location = str(input("Enter Institution Location:").rstrip())

reciever_id = "test mail id" # institution_lookup[institution][location] # get the mail id for the institution

print("logging in")
yag = yagmail.SMTP(gamil_id, gamil_password)
print("logged in successfully")

html = """\
<p>Hi,<br>
    How are you?<br>
    <a href="https://pypi.python.org/pypi/sky/">Click me!</a>
</p>
"""
print("sending mail")
yag.send(to = reciever_id, subject='My report', contents = [html])
print("mail sent")