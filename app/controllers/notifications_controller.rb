class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def read
    notification = Noticed::Notification.find_by(id: params[:id], recipient: current_user)

    if notification
      notification.update(read_at: Time.current)
      flash[:notice] = 'Notification marked as read.'
    else
      flash[:alert] = "Notification not found or you don't have access."
    end

    redirect_to notifications_path
  end
end
