require './mailin.rb'

m = Mailin.new("https://api.sendinblue.com/v2.0","<your access key>")

# This will initiate the API with the endpoint and your access key.


#This will send a transactional email

 
# Prepare variables for easy use 

data = { "to" => {"to@example.net"=>"to whom!"},
	"cc" => {"cc@example.net"=>"cc whom!"},
	"bcc" => {"bcc@example.net"=>"bcc whom!"},
	"from" => ["from@email.com","from email!"],
	"replyto" => ["replyto@email.com","reply to!"],
	"subject" => "My subject",
	"text" => "This is the text",
	"html" => "This is the <h1>HTML</h1><br/>
	This is inline image 1.<br/>
	<img src=\"{myinlineimage1.png}\" alt=\"image1\" border=\"0\"><br/>
	Some text<br/>
	This is inline image 2.<br/>
	<img src=\"{myinlineimage2.jpg}\" alt=\"image2\" border=\"0\"><br/>
	Some more text<br/>
	Re-used inline image 1.<br/>
	<img src=\"{myinlineimage1.png}\" alt=\"image3\" border=\"0\">",
	"attachment" => [],
	"headers" => {"Content-Type"=> "text/html;charset=iso-8859-1","X-param1"=> "value1", "X-param2"=> "value2","X-Mailin-custom"=>"my custom value", "X-Mailin-IP"=> "102.102.1.2", "X-Mailin-Tag" => "My tag"},
	"inline_image" => {"myinlineimage1.png" => "your_png_files_base64_encoded_chunk_data","myinlineimage2.jpg" => "your_jpg_files_base64_encoded_chunk_data"}
}

result = m.send_email(data)