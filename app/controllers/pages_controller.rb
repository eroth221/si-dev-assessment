require 'twilio-ruby'
class PagesController < ApplicationController
  def home
  end

  def sms
    if(params.has_key?(:message) && params.has_key?(:number))
      @message = params[:message]
      @number = params[:number]
    end
    account_sid = ENV["ACC_SID"]  #Account SID. In Hidden File
    auth_token = ENV["AUTH_TOKEN"] #Auth Token. In Hidden File
    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.account.messages.create(:body =>  params[:message],
    :to => params[:number],
    :from => ENV["TWILIO_NUM"]) #Twilio Number. In Hidden File
    puts message.sid
  end
  
end
