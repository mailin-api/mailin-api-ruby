require 'json'
require 'base64'
require 'httparty'
require 'openssl'

class Mailin
        @base_url = ""
        @access_key = "Your access key"
        @secret_key = "Your secret key"
        def initialize(base_url,access_key,secret_key)
                @base_url = base_url
                @access_key = access_key
                @secret_key = secret_key
        end
        def do_request(resource,method,input)
                called_url = @base_url + "/" + resource
                c_date_time = "" #Time.now.to_s
                md5_content = ""
                if input!=""
                        md5_content = Digest::MD5.hexdigest(input)
                end
                content_type = "application/json"
                sign_string = method + "\n" + md5_content + "\n" + content_type + "\n" + c_date_time + "\n" + called_url
                digest = OpenSSL::Digest::Digest.new('sha1')
                signature = Base64.encode64(OpenSSL::HMAC.hexdigest(digest,@secret_key,sign_string.encode("UTF-8")))

                case method
                when "GET"
                        response = HTTParty.get(called_url,:body=>input, :headers => {"content-type"=>content_type,"X-mailin-date"=>c_date_time,"Authorization"=>@access_key+":"+signature})
                when "POST"
                        response = HTTParty.post(called_url,:body=>input, :headers => {"content-type"=>content_type,"X-mailin-date"=>c_date_time,"Authorization"=>@access_key+":"+signature})
                when "PUT"
                        response = HTTParty.put(called_url,:body=>input, :headers => {"content-type"=>content_type,"X-mailin-date"=>c_date_time,"Authorization"=>@access_key+":"+signature})
                else
                        response = HTTParty.delete(called_url,:body=>input, :headers => {"content-type"=>content_type,"X-mailin-date"=>c_date_time,"Authorization"=>@access_key+":"+signature})
                end
                return response.body
	end
	def get(resource,input)
		return do_request(resource,"GET",input)
	end
        def post(resource,input)
                return do_request(resource,"POST",input)
        end
        def put(resource,input)
                return do_request(resource,"PUT",input)
        end
        def delete(resource,input)
                return do_request(resource,"DELETE",input)
        end
	def get_account()
		return self.get("account","")
	end
	def create_child_account(email,password,company_org,first_name,last_name,credits)
		return self.post("account",{"child_email"=> email,"password"=> password,"company_org"=> company_org,"first_name"=> first_name,"last_name"=> last_name,"credits"=> credits}.to_json)
	end
	def update_child_account(child_authkey,company_org,first_name,last_name,password)
		return self.put("account",{"auth_key"=> child_authkey,"company_org"=> company_org,"first_name"=> first_name,"last_name"=> last_name,"password"=> password}.to_json)
	end
	def delete_child_account(child_authkey)
		return self.delete("account/" + child_authkey,"")
	end
	def add_remove_child_credits(child_authkey,add_credits,remove_credits)
		return self.post("account/addrmvcredit",{"auth_key"=> child_authkey,"add_credit"=> add_credits,"rmv_credit"=> remove_credits}.to_json)
	end
	def send_sms(to,from,text,web_url,tag,type)
		return self.post("sms",{"text"=> text,"tag"=> tag,"web_url"=> web_url,"from"=> from,"to"=> to,"type"=> type}.to_json)
	end
	def create_sms_campaign(camp_name,sender,content,bat_sent,listids,exclude_list,scheduled_date)
		return self.post("sms",{"name"=> camp_name,"sender"=> sender,"content"=> content,"bat"=> bat_sent,"listid"=> listids,"exclude_list"=> exclude_list,"scheduled_date"=> scheduled_date}.to_json)
	end
	def update_sms_campaign(id,camp_name,sender,content,bat_sent,listids,exclude_list,scheduled_date)
		return self.put("sms/" + id,{"name"=> camp_name,"sender"=> sender,"content"=> content,"bat"=> bat_sent,"listid"=> listids,"exclude_list"=> exclude_list,"scheduled_date"=> scheduled_date}.to_json)
	end
	def get_campaigns(type)
		if type == ""
		return self.get("campaign/","")
		else
		return self.get("campaign/type/" + type + "/","")
		end
	end
	def get_campaign(id)
		return self.get("campaign/" + id,"")
	end
	def create_campaign(category,from_name,name,bat_sent,html_content,html_url,listid,scheduled_date,subject,from_email,reply_to,exclude_list)
		return self.post("campaign",{"category"=> category,"from_name"=> from_name,"name"=> name,"bat_sent"=> bat_sent,"html_content"=> html_content,"html_url"=> html_url,"listid"=> listid,"scheduled_date"=> scheduled_date,"subject"=> subject,"from_email"=> from_email,"reply_to" => reply_to,"exclude_list" => exclude_list}.to_json)
	end
	def delete_campaign(id)
		return self.delete("campaign/" + id,"")
	end
	def update_campaign(id,category,from_name,name,bat_sent,html_content,html_url,listid,scheduled_date,subject,from_email,reply_to,exclude_list)
		return self.put("campaign/" + id,{"category"=> category,"from_name"=> from_name,"name"=> name,"bat_sent"=> bat_sent,"html_content"=> html_content,"html_url"=> html_url,"listid"=> listid,"scheduled_date"=> scheduled_date,"subject"=> subject,"from_email"=> from_email,"reply_to" => reply_to,"exclude_list" => exclude_list}.to_json)
	end
	def campaign_report_email(id,lang,email_subject,email_to,email_content_type,email_bcc,email_cc,email_body)
		return self.post("campaign/" + id + "/report",{"lang"=> lang,"email_subject"=> email_subject,"email_to"=> email_to,"email_content_type"=> email_content_type,"email_bcc"=> email_bcc,"email_cc"=> email_cc,"email_body"=> email_body}.to_json)
	end
	def campaign_recipients_export(id,notify_url,type)
		return self.post("campaign/" + id + "/report",{"notify_url"=> notify_url,"type"=> type}.to_json)
	end
	def send_bat_email(campid,email_to)
    	return self.post("campaign/" + campid + "/test",{"emails"=> email_to}.to_json)
	end
	def get_processes()
		return self.get("process","")
	end
	def get_process(id)
		return self.get("process/" + id,"")
	end
	def get_lists()
		return self.get("list","")
	end
	def get_list(id)
		return self.get("list/" + id,"")
	end
	def create_list(list_name,list_parent)
		return self.post("list",{"list_name"=> list_name,"list_parent"=> list_parent}.to_json)
	end
	def delete_list(id)
		return self.delete("list/" + id,"")
	end
	def update_list(id,list_name,list_parent)
		return self.put("list/" + id,{"list_name"=> list_name,"list_parent"=> list_parent}.to_json)
	end
	def add_users_list(id,users)
		return self.post("list/" + id + "/users",{"users"=> users}.to_json)
	end
	def delete_users_list(id,users)
		return self.delete("list/" + id + "/delusers",{"users"=> users}.to_json)
	end
	def send_email(to,subject,from,html,text,cc,bcc,replyto,attachment,headers)
		return self.post("email",{"cc"=> cc,"text"=> text,"bcc"=> bcc,"replyto"=> replyto,"html"=> html,"to"=> to,"attachment"=> attachment,"from"=> from,"subject"=> subject,"headers" => headers}.to_json)
	end
	def get_webhooks()
		return self.get("webhook","")
	end
	def get_webhook(id)
		return self.get("webhook/" + id,"")
	end
	def create_webhook(url,description,events)
		return self.post("webhook",{"url"=> url,"description"=> description,"events"=> events}.to_json)
	end
	def delete_webhook(id)
		return self.delete("webhook/" + id,"")
	end
	def update_webhook(id,url,description,events)
		return self.put("webhook/" + id,{"url"=> url,"description"=> description,"events"=> events}.to_json)
	end
	def get_statistics(aggregate,tag,days,end_date,start_date)
		return self.post("statistics",{"aggregate"=> aggregate,"tag"=> tag,"days"=> days,"end_date"=> end_date,"start_date"=> start_date}.to_json)
	end
	def get_user(id)
		return self.get("user/" + id,"")
	end
	def create_user(attributes,blacklisted,email,listid)
		return self.post("user",{"attributes"=> attributes,"blacklisted"=> blacklisted,"email"=> email,"listid"=> listid}.to_json)
	end
	def delete_user(id)
		return self.delete("user/" + id,"")
	end
	def update_user(id,attributes,blacklisted,listid,listid_unlink)
		return self.put("user/" + id,{"attributes"=> attributes,"blacklisted"=> blacklisted,"listid"=> listid,"listid_unlink"=> listid_unlink}.to_json)
	end
	def import_users(url,listids,notify_url,name)
		return self.post("user/import",{"url"=> url,"listids"=> listids,"notify_url"=> notify_url,"name"=> name}.to_json)
	end
	def export_users(export_attrib,filter,notify_url)
		return self.post("user/export",{"export_attrib"=> export_attrib,"filter"=> filter,"notify_url"=> notify_url}.to_json)
	end
	def create_update_user(email,attributes,blacklisted,listid,listid_unlink)
    	return self.post("user/createdituser",{"email"=> email,"attributes"=> attributes,"blacklisted"=> blacklisted,"listid"=> listid,"listid_unlink"=> listid_unlink}.to_json)
	end
	def get_attributes()
		return self.get("attribute","")
	end
	def get_attribute(id)
		return self.get("attribute/" + id,"")
	end
	def create_attribute(type,data)
		return self.post("attribute",{"type"=> type,"data"=> data}.to_json)
	end
	def delete_attribute(id,data)
		return self.post("attribute/" + id,{"data"=> data}.to_json)
	end
	def get_report(limit,start_date,end_date,offset,date,days,email)
		return self.post("report",{"limit"=> limit,"start_date"=> start_date,"end_date"=> end_date,"offset"=> offset,"date"=> date,"days"=> days,"email"=> email}.to_json)
	end
	def get_folders()
		return self.get("folder","")
	end
	def get_folder(id)
		return self.get("folder/" + id,"")
	end
	def create_folder(name)
		return self.post("folder",{"name"=> name}.to_json)
	end
	def delete_folder(id)
		return self.delete("folder/" + id,"")
	end
	def update_folder(id,name)
		return self.put("folder/" + id,{"name"=> name}.to_json)
	end
	def delete_bounces(start_date,end_date,email)
		return self.post("bounces",{"start_date"=> start_date,"end_date"=> end_date,"email"=> email}.to_json)
	end
	def send_transactional_template(id,to,cc,bcc,attr)
		return self.put("template/" + id,{"cc"=> cc,"to"=> to,"attr"=> attr,"bcc"=> bcc}.to_json)
	end
	def create_trigger_campaign(category,from_name,name,bat_sent,html_content,html_url,listid,scheduled_date,subject,from_email,reply_to,to_field,exclude_list,recurring)
		return self.post("campaign",{"category"=> category,"from_name"=> from_name,"trigger_name"=> name,"bat"=> bat_sent,"html_content"=> html_content,"html_url"=> html_url,"listid"=> listid,"scheduled_date"=> scheduled_date,"subject"=> subject,"from_email"=> from_email,"reply_to"=> reply_to,"to_field"=> to_field,"exclude_list"=> exclude_list,"recurring"=> recurring}.to_json)
	end
	def update_trigger_campaign(id,category,from_name,name,bat_sent,html_content,html_url,listid,scheduled_date,subject,from_email,reply_to,to_field,exclude_list,recurring)
		return self.put("campaign/" + id,{"category"=> category,"from_name"=> from_name,"trigger_name"=> name,"bat"=> bat_sent,"html_content"=> html_content,"html_url"=> html_url,"listid"=> listid,"scheduled_date"=> scheduled_date,"subject"=> subject,"from_email"=> from_email,"reply_to"=> reply_to,"to_field"=> to_field,"exclude_list"=> exclude_list,"recurring"=> recurring}.to_json)
	end
	def create_template(from_name,name,bat_sent,html_content,html_url,subject,from_email,reply_to,to_field,status)
		return self.post("template",{"from_name"=> from_name,"template_name"=> name,"bat"=> bat_sent,"html_content"=> html_content,"html_url"=> html_url,"subject"=> subject,"from_email"=> from_email,"reply_to"=> reply_to,"to_field"=> to_field,"status"=> status}.to_json)
	end
	def update_template(id,from_name,name,bat_sent,html_content,html_url,subject,from_email,reply_to,to_field,status)
		return self.put("template/" + id,{"from_name"=> from_name,"template_name"=> name,"bat"=> bat_sent,"html_content"=> html_content,"html_url"=> html_url,"subject"=> subject,"from_email"=> from_email,"reply_to"=> reply_to,"to_field"=> to_field,"status"=> status}.to_json)
	end
	def campaign_share_link(campaign_ids)
    	return self.post("campaign/sharelink",{"camp_ids"=> campaign_ids})
	end
	def create_sender(sender_name,sender_email,ip_domain)
		return self.post("advanced",{"name"=> sender_name,"email"=> sender_email,"ip_domain"=> ip_domain}.to_json)
	end
	def update_sender(id,sender_name,sender_email,ip_domain)
		return self.put("advanced/" + id,{"name"=> sender_name,"email"=> sender_email,"ip_domain"=> ip_domain}.to_json)
	end
	def delete_sender(id)
		return self.delete("advanced/" + id,"")
	end
end


