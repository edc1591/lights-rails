APN = Houston::Client.production
APN.certificate = File.read("config/apple_push_notification_production.pem")

APN_dev = Houston::Client.development
APN_dev.certificate = File.read("config/apple_push_notification_development.pem")