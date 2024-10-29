class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def read
    # Find the notification for the current user using the provided ID
    notification = Noticed::Notification.find_by(id: params[:id], recipient: current_user)

    if notification
      # Update the read_at column to mark it as read for this specific user
      notification.update(read_at: Time.current)
      flash[:notice] = "Notification marked as read."
    else
      flash[:alert] = "Notification not found or you don't have access."
    end

    # Redirect to the notifications page or wherever you need
    redirect_to notifications_path
  end
end
