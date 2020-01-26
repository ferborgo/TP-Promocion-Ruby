class Follow < ActiveRecord::Base

  extend ActsAsFollower::FollowerLib
  extend ActsAsFollower::FollowScopes

  # NOTE: Follows belong to the "followable" and "follower" interface
  belongs_to :followable, polymorphic: true
  belongs_to :follower,   polymorphic: true

  def block!
    self.update_attribute(:blocked, true)
  end

  after_create :create_notification

  def create_notification
    Notification.create do |notification|
      notification.notify_type = 'follower'

      # Who creates the notification
      notification.actor = self.follower

      # Who receives the notification.
      notification.user = self.followable

      notification.target = self

    end
  end

end
