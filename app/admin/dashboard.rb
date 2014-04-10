ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  page_action :push, :method => :post do
    params[:user_ids].each do |user_id|
      user = User.find_by_id(user_id)
      user.device_tokens.each do |token|
        notification = Houston::Notification.new(device: token)
        notification.alert = params[:alert]
        notification.badge = params[:badge]
        notification.sound = params[:sound] unless params[:sound] == 'silent'
        notification.content_available = params[:content_available]
        notification.custom_data = JSON.parse(params[:custom]) unless params[:custom] == ""
        if params[:env] == 'prod'
          APN.push(notification)
        elsif params[:env] == 'dev'
          APN_dev.push(notification)
        end
      end
    end
    redirect_to admin_dashboard_path, :notice => "Notification(s) Sent"
  end

  content do
    columns do
      column do
        panel "Push Notifications" do
          render partial: "send_push"
        end        
      end
    end
  end
end
