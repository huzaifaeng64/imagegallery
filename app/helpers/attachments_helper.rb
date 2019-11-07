module AttachmentsHelper
  def check_for_user_like(attachment)
    if user_signed_in?
      if attachment.already_liked(attachment, current_user)
        return true
      end
      return false
    end
    return false
  end
  def show_image_thumb(attachment)
    attachment.image.thumb.url if attachment.image?
  end
  def show_gallery_image(user)
    user.attachments.last.image.large_thumb.url
  end
end
