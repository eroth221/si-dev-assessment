class PagesController < ApplicationController
  def home
  end

  def sms
    if(params.has_key?(:message) && params.has_key?(:number))
      @message = params[:message]
      @number = params[:number]
    end
  end
end
