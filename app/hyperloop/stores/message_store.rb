class MessageStore < Hyperloop::Store
  state :messages, scope: :class, reader: :all
  #state :user_name, scope: :class, reader: true

  def self.messages?
    state.messages
  end

  receives MessagesOperations::GetMessages do |params|
    puts "receiving MessagesOperations::GetMessages(#{params})"
    mutate.messages params.messages
  end

  receives MessagesOperations::Send do |params|
    puts "receiving MessagesOperations::Send(#{params})"
    mutate.messages << params.message
  end

  receives MessagesOperations::TestServerOp do |params|
    puts "receiving MessagesOperations::TestServerOp(#{params})"
  end

  receives MessagesOperations::TestOp do |params|
    puts "receiving MessagesOperations::TestOp(#{params})"
  end
end