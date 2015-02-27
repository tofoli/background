# Background
Class to create a queue of processes that run in Background
```ruby
load 'background.rb'
Background.new do
	Database.reply()
end

bc = Background.new do
	Bank.integration()
end

bc.finished do
	msg = bc.error? ?
		"Was not possible to complete the process!<br />Error: #{bc.error}" :
		'Successfully Completed'
	Email.send(msg)
end
```
