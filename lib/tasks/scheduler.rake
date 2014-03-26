desc "Send a silent push to schedule the sunset notification"
task :schedule_sunset => :environment do
  puts "Send sunset silent push"
  User.all.each do |user|
  	if !user.device_tokens.nil?
	    user.device_tokens.each do |token|
	      notification = Houston::Notification.new(device: token)
	      notification.content_available = true
	      notification.custom_data = {event: "schedule_sunset"}
	      APN.push(notification)
	    end
  	end
  end
end