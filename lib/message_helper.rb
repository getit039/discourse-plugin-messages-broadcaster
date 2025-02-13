# frozen_string_literal: true
module MessageHelper
  def self.send_private_message(sender_username, receiver_username, subject, body)
    sender = User.find_by(username: sender_username)
    receiver = User.find_by(username: receiver_username)

    return { error: "Invalid sender or receiver" } if sender.nil? || receiver.nil?

    topic = Topic.create!(
      title: subject,
      archetype: Archetype.private_message,
      category_id: nil,
      user: sender
    )

    Post.create!(
      topic: topic,
      user: sender,
      raw: body
    )

    topic.invite_message(sender, receiver)

    { success: true, message: "Message sent successfully!" }
  rescue StandardError => e
    { error: e.message }
  end
end
