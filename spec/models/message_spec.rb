require 'rails_helper'



describe Message, :vcr => true do
  it 'adds an error if the to number is invalid' do
    message = Message.new(:body => 'hi', :to => '1111111', :from => '5005550006')
    message.save
    message.errors.messages[:base].should eq ["The 'To' number 1111111 is not a valid phone number."]
  end
end


describe Message, :vcr => true do
  it 'throws diffrent error' do
    message = Message.new(:body => 'hi', :to => '+15005550001', :from => '5005550006')
    message.save
    message[:body].should eq "hi"
  end
end
