class Recommendation < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :user, :book, presence: true
  validates_associated :book, :user

  paginates_per 3

  after_create :create_notification

  def create_notification
    self.user.followers.each do |user|
      Notification.create do |notification|
        notification.notify_type = 'recommendation'

        # Who creates the notification
        notification.actor = self.user

        # Who receives the notification.
        notification.user = user

        # The actual Recommendation. It contains the book and the optional content
        notification.target = self

      end
    end
  end
end
