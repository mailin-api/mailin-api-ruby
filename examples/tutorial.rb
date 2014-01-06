require './mailin'

m = Mailin.new("https://api.sendinblue.com/v1.0","<your access key>","<your secret key>")

# This will initiate the API with the endpoint and your access and secret key.

to = {'to@example.net'=>'to email'} #mandatory
subject = 'Mon subject' #mandatory
from = ['from@example.net','from email'] #mandatory
html = '<h1> hello html </h1>' #mandatory
text = 'text'
cc = {'cc@example.net'=>'cc email'}
bcc = {'bcc@example.net'=>'b cc email'}
replyto = ['rpely@example.net','reply email']
attachment=[]
headers=[]
print m.send_email(to,subject,from,html,text,cc,bcc,replyto,attachment,headers)
