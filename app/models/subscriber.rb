class Subscriber < ActiveRecord::Base
  
  # Notify our appointment attendee X minutes before the appointment time
  def send_message(msg, image_url)
    @twilio_number = ENV['18134454087']
    @client = Twilio::REST::Client.new ENV['AC731657ffb5aeef656a7c2f907d6e4155'], ENV['b12d4b5a3f0e60ad22280080482fda93']
    message = @client.account.messages.create(
      :from => @twilio_number,
      :to => self.phone_number,
      :body => msg,
      :media_url => image_url
    )
    puts message.to
  end

end
