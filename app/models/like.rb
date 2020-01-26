class Like < ApplicationRecord
  belongs_to :opinion
  belongs_to :user

  after_create :create_notification

  def create_notification
    Notification.create do |notification|
      notification.notify_type = 'like'

      # Who creates the notification
      notification.actor = self.user

      # Who receives the notification.
      notification.user = self.opinion.user

      # The 'like'. It contains the opinion, therefor the book.
      notification.target = self

    end
  end
end
