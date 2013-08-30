require 'mailin'

m = Mailin.new("http://api-dev.mailin.fr","<your access key>","<your secret key>")
m.get_campaigns()
