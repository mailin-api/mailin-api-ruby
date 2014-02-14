# Examples

These are examples to get you started

tutorial.rb

## Available functions

 * [get_account](https://apidocs.sendinblue.com/account/)() - Get your account information
 * [get_campaigns](https://apidocs.sendinblue.com/campaign/#1)() - Get list of all campaigns
 * [get_campaign](https://apidocs.sendinblue.com/campaign/#2)(id) - Get specific campaign object
 * [create_campaign](https://apidocs.sendinblue.com/campaign/#3)(category,from_name,name,bat_sent,tags,html_content,html_url,listid,scheduled_date,subject) - Create a campaign
 * [delete_campaign](https://apidocs.sendinblue.com/campaign/#4)(id) - Delete a campaign
 * [update_campaign](https://apidocs.sendinblue.com/campaign/#5)(id,category,from_name,name,bat_sent,tags,html_content,html_url,listid,scheduled_date,subject) - Update campaign information
 * [campaign_report_email](https://apidocs.sendinblue.com/campaign/#6)(id,lang,email_subject,email_to,email_content_type,email_bcc,email_cc,email_body) - Sending reports to specific emails
 * [campaign_recipients_export](https://apidocs.sendinblue.com/campaign/#7)(id,notify_url,type) - Export recipients of a campaign
 * [get_campaignstats](https://apidocs.sendinblue.com/campaign-statistics/#1)() - Get all the campaign stats
 * [get_campaignstat](https://apidocs.sendinblue.com/campaign-statistics/#2)(id) - Get all the campaign details for campaign with the specific id
 * [get_folders](https://apidocs.sendinblue.com/folder/#1)() - Get list of all the folder details.
 * [get_folder](https://apidocs.sendinblue.com/folder/#2)(id) - Get all the folder details for folder with id <id>
 * [create_folder](https://apidocs.sendinblue.com/folder/#3)(name) - Create a folder
 * [delete_folder](https://apidocs.sendinblue.com/folder/#4)(id) - Delete folder with folder id <id>
 * [update_folder](https://apidocs.sendinblue.com/folder/#5)(id,name) - Update folder with folder id <id>
 * [get_lists](https://apidocs.sendinblue.com/list/#1)() - Get all the lists
 * [get_list](https://apidocs.sendinblue.com/list/#2)(id) - Get information about a list
 * [create_list](https://apidocs.sendinblue.com/list/#3)(list_name,list_parent) - Create a list
 * [delete_list](https://apidocs.sendinblue.com/list/#4)(id) - Delete a list
 * [update_list](https://apidocs.sendinblue.com/list/#5)(id,list_name,list_parent) - Updating a list
 * [display_list_users](https://apidocs.sendinblue.com/list/#8)(listids,page,page_limit) - Display details of all users for the given lists
 * [add_users_list](https://apidocs.sendinblue.com/list/#6)(id,users) - Add users to a list
 * [delete_users_list](https://apidocs.sendinblue.com/list/#7)(id,users) - Delete users from a list
 * [get_attributes](https://apidocs.sendinblue.com/attribute/#1)() - Listing all attributes
 * [get_attribute](https://apidocs.sendinblue.com/attribute/#2)(id) - Listing a certain type attributes
 * [create_attribute](https://apidocs.sendinblue.com/attribute/#3)(type,data) - Creating attributes
 * [delete_attribute](https://apidocs.sendinblue.com/attribute/#4)(id,data) - Deleting attributes
 * [get_user](https://apidocs.sendinblue.com/user/#2)(id) - Get information about a user/email
 * [get_user_stats](https://apidocs.sendinblue.com/user/#7)(id) - Get event information about the user/email
 * [create_user](https://apidocs.sendinblue.com/user/#1)(attributes,blacklisted,email,listid) - Add a new user/email
 * [delete_user](https://apidocs.sendinblue.com/user/#4)(id) - Delete a user/email
 * [update_user](https://apidocs.sendinblue.com/user/#3)(id,attributes,blacklisted,listid) - Edit a user/email information
 * [import_users](https://apidocs.sendinblue.com/user/#5)(url,listids,notify_url,name) - Import users/emails
 * [export_users](https://apidocs.sendinblue.com/user/#6)(export_attrib,filer,notify_url) - Export users/emails
 * [send_sms](https://apidocs.sendinblue.com/sms/)(text,tag,web_url,sms_from,sms_to) - Sending a SMS
 * [get_processes](https://apidocs.sendinblue.com/process/#1)() - Get information about all background processes
 * [get_process](https://apidocs.sendinblue.com/process/#2)(id) - Get information about a specific process
 * [get_report](https://apidocs.sendinblue.com/report/)(limit,start_date,end_date,offset,date,days,email) - Retrieve information for all report events
 * [get_statistics](https://apidocs.sendinblue.com/statistics/)(aggregate,tag,days,end_date,start_date) - Get aggregate statistics about emails sent
 * [get_webhooks](https://apidocs.sendinblue.com/webhooks/#1)() - List registered webhooks
 * [get_webhook](https://apidocs.sendinblue.com/webhooks/#2)(id) - Get information about a webhook
 * [create_webhook](https://apidocs.sendinblue.com/webhooks/#3)(url,description,events) - Registering a webhook
 * [delete_webhook](https://apidocs.sendinblue.com/webhooks/#5)(id) - Deleting a webhook
 * [update_webhook](https://apidocs.sendinblue.com/webhooks/#4)(id,url,description,events) - Editing a webhook
 * [delete_bounces](https://apidocs.sendinblue.com/bounces/)(start_date,end_date,email) - Deleting bounces
 * [send_email](https://apidocs.sendinblue.com/tutorial-sending-transactional-email/)(to,subject,from,html,text,cc,bcc,replyto,attachment) - Sending out a transactional email
 * [send_transactional_template](https://apidocs.sendinblue.com/template/)(id,to,cc,bcc,attr) - Send templates created on mailin, through mailin smtp.
