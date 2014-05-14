class Conversation < ActiveRecord::Base
  belongs_to  :user_one, :class_name => 'User'
  belongs_to  :user_two, :class_name => 'User'
  has_many    :conversation_message;
  
  attr_accessor :last_message

  def as_json(options={})
    super(:include =>  [:user_one, :user_two], :methods =>[:last_message]) 
  end

  def last_message
  	   conversation_message.last
  end
end
