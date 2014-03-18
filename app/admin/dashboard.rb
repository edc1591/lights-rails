ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  page_action :push, :method => :post do
    params[:user_ids].each do |user_id|
      notification = Houston::Notification.new(device: User.find_by_id(user_id).device_token)
      notification.alert = params[:alert]
      notification.badge = params[:badge]
      notification.sound = params[:sound] unless params[:sound] == 'silent'
      APN.push(notification)
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
