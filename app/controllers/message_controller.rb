# frozen_string_literal: true
class MessageController < ApplicationController
    requires_plugin :discourse_plugin_messages_broadcaster
  
    def index
      render json: { status: "ok", message: "Message form is ready." }
    end
  
    def create
      sender = User.find_by(username: params[:sender])
      receiver = User.find_by(username: params[:receiver])
  
      if sender.nil? || receiver.nil?
        render json: { error: "Invalid sender or receiver" }, status: 400
        return
      end
  
      topic = Topic.create!(
        title: params[:subject],
        archetype: Archetype.private_message,
        category_id: nil,
        user: sender
      )
  
      Post.create!(
        topic: topic,
        user: sender,
        raw: params[:body]
      )
  
      topic.invite_message(sender, receiver)
  
      render json: { success: true, message: "Message sent successfully!" }
    end
  end
  