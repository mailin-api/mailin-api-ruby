require 'mailin'

m = Mailin.new("https://api.mailinblue.com/v1.0","<your access key>","<your secret key>")
m.get_campaigns()
