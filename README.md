# Mailin Ruby API

You will need to install the following module
* json
* httparty
* openssl

It currently supports all the API calls for v1.0. Each call returns an Object that is documented in our API docs, here are the objects.

 * Account
 * Campaign
 * Campaign statistics
 * Folder
 * List
 * Attribute
 * User
 * SMS
 * Process

### SMTP APIs

 * File
 * Mail
 * Bounces
 * Template
 * Report
 * Statistics
 * Webhooks

## Quickstart

1. You will need to first get the Access key and Secret key from [Mailinblue](https://www.mailinblue.com).

2. Assuming that you have cloned this git repo, or downloaded mailin.js . You can use this small sample script to get started
```ruby
require 'mailin'
m = Mailin.new("https://api.mailinblue.com/v1.0","<your access key>","<your secret key>")
m.get_campaigns()
```
3. To explore more, you should visit the [Mailin API documentation](https://apidocs.mailinblue.com).

