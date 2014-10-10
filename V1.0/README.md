# SendinBlue Ruby Library

This is the official SendinBlue Ruby API wrapper. You will need to install the following module
* json
* httparty
* openssl

## Quickstart

1. You will need to first get the Access key and Secret key from [SendinBlue](https://www.sendinblue.com).

2. Assuming that you have cloned this git repo. You can use this small sample script to get started
```ruby
require './mailin'
m = Mailin.new("https://api.sendinblue.com/v1.0","<your access key>","<your secret key>")
m.get_campaigns()
```
3. To explore more, you should visit the [SendinBlue API documentation](https://apidocs.sendinblue.com).

## Available functions

List of API calls that you can make. Please do note that the order of parameters are important.

### Campaign calls

 * get_account() - Get your account information
 * get_smtp_details() - Get your SMTP account information
 * create_child_account(email,password,company_org,first_name,last_name,credits) - Create a Reseller child account
 * update_child_account(child_authkey,company_org,first_name,last_name,password) - Update a Reseller child account
 * delete_child_account(child_authkey) - Delete a Reseller child account
 * get_child_account(child_authkey) - Get Reseller child accounts
 * add_remove_child_credits(childauthkey,add_credits,remove_credits) - Add/Remove Reseller child credits
 * get_campaigns(type,status,page,page_limit) - Get list of all campaigns or of specific type or status or both
 * get_campaign(id) - Get specific campaign object
 * create_campaign(category,from_name,name,bat_sent,html_content,html_url,listid,scheduled_date,subject,from_email,reply_to,to_field,exclude_list) - Create a campaign
 * delete_campaign(id) - Delete a campaign
 * update_campaign(id,category,from_name,name,bat_sent,html_content,html_url,listid,scheduled_date,subject,from_email,reply_to,to_field,exclude_list) - Update campaign information
 * campaign_report_email(id,lang,email_subject,email_to,email_content_type,email_bcc,email_cc,email_body) - Sending reports to specific emails
 * campaign_recipients_export(id,notify_url,type) - Export recipients of a campaign
 * send_bat_email(campid,email_to) - Send a test Email (bat)
 * create_trigger_campaign(category,from_name,name,bat_sent,html_content,html_url,listid,scheduled_date,subject,from_email,reply_to,to_field,exclude_list,recurring) - Create a trigger campaign
 * update_trigger_campaign(id,category,from_name,name,bat_sent,html_content,html_url,listid,scheduled_date,subject,from_email,reply_to,to_field,exclude_list,recurring) - Update trigger campaign information
 * campaign_share_link)(campaign_ids) - Get campaign share link
 * update_campaign_status)(id,status) - Modify a campaign status
 * get_folders() - Get list of all the folder details.
 * get_folder(id) - Get all the folder details for folder with id <id>
 * create_folder(name) - Create a folder
 * delete_folder(id) - Delete folder with folder id <id>
 * update_folder(id,name) - Update folder with folder id <id>
 * get_lists() - Get all the lists
 * get_list(id) - Get information about a list
 * create_list(list_name,list_parent) - Create a list
 * delete_list(id) - Delete a list
 * update_list(id,list_name,list_parent) - Updating a list
 * add_users_list(id,users) - Add users to a list
 * delete_users_list(id,users) - Delete users from a list
 * get_attributes() - Listing all attributes
 * get_attribute(type) - Listing a certain type attributes
 * create_attribute(type,data) - Creating attributes
 * delete_attribute(type,data) - Deleting attributes
 * get_user(id) - Get information about a user/email
 * create_update_user(email,attributes,blacklisted,listid,listid_unlink,blacklisted_sms) - Create/Update a user information
 * delete_user(id) - Deleting user from db is not permitted but this action will unlink him from all lists
 * import_users(url,listids,notify_url,name) - Import users/emails
 * export_users(export_attrib,filter,notify_url) - Export users/emails
 * get_processes() - Get information about all background processes
 * get_process(id) - Get information about a specific process
 * get_senders(option) - Get information about all/specific senders
 * create_sender(sender_name,sender_email,ip_domain) - Create a sender
 * delete_sender(id) - Delete a sender
 * update_sender(id,sender_name,sender_email,ip_domain) - Update a sender

### SMTP calls

 * get_report(limit,start_date,end_date,offset,date,days,email) - Retrieve information for all report events
 * get_statistics(aggregate,tag,days,end_date,start_date) - Get aggregate statistics about emails sent
 * get_webhooks() - List registered webhooks
 * get_webhook(id) - Get information about a webhook
 * create_webhook(url,description,events) - Registering a webhook
 * delete_webhook(id) - Deleting a webhook
 * update_webhook(id,url,description,events) - Editing a webhook
 * delete_bounces(start_date,end_date,email) - Deleting bounces
 * send_email(to,subject,from_name,html,text,cc,bcc,replyto,attachment,headers) - Sending out a transactional email
 * send_transactional_template(id,to,cc,bcc,attr) - Send templates created on Sendinblue, through Sendinblue smtp.
 * create_template(from_name,name,bat_sent,html_content,html_url,subject,from_email,reply_to,to_field,status) - Create a template 
 * update_template(id,from_name,name,bat_sent,html_content,html_url,subject,from_email,reply_to,to_field,status) - Update template information

### SMS calls

 * send_sms(to,from_name,text,web_url,tag,type) - Sending a SMS
 * create_sms_campaign(camp_name,sender,content,bat_sent,listids,exclude_list,scheduled_date) - Create a SMS campaign
 * update_sms_campaign(id,camp_name,sender,content,bat_sent,listids,exclude_list,scheduled_date) - Update a SMS campaign
 * send_bat_sms(campid,mobilephone) - Send a test SMS campaign