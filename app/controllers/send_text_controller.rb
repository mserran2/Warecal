class SendTextController < ApplicationController
  def index
    
  end
  
  def new
    respond_to do |format|
      format.html # new.html.erb
    end
  end
  
  def show
    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def create
    number_to_send_to = params[:phone]
    
    #mserran2@swarthmore.edu THIS IS A TESTING ACCOUNT
=begin
    twilio_sid = "AC19c8733707d9a0fca6b3a1097dab4873"
    twilio_token = "7c9b43933c44c4d42deeb1a32b3c25bf"
    twilio_phone_number = "4155992671"
=end
    #mserran2@me.com THIS IS A LIVE ACCOUNT
    twilio_sid = "AC79244e2375224e1ab2b1e9d5073d5d31"
    twilio_token = "75cc871530dc7bd8b8ff2ea2b91c5ad6"
    twilio_phone_number = "6104223819"

    @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token

    @twilio_client.account.sms.messages.create(
      :from => "+1#{twilio_phone_number}",
      :to => number_to_send_to,
      :body => params[:message]
    )
    
     respond_to do |format|
      format.html { redirect_to send_text_index_path, notice: 'Text was successfully sent.' }
     end
  end
  
end
