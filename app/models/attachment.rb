class Attachment < ApplicationRecord
	belongs_to :user
<<<<<<< HEAD
	has_many :reactions

	mount_uploader :image, ImageUploader

=======
	mount_uploader :image, ImageUploader
	
>>>>>>> reaction-functionality
	validates :title, presence: true
	validates :description, presence: true
	validates :image_type, presence: true
	validates :place, presence: true
	validates :price, presence: true, numericality: { only_integer: true }
	validates :created_by, presence: true
	validates :image, presence: true, file_size: { less_than: 1.megabyte }

<<<<<<< HEAD
	# method to update amount after successful transaction
	def update_attachment_after_order(amount)
		if self.update(amount: amount)
=======
	def update_attachment_after_order(attachment_amount)
		if self.update(amount: attachment_amount)
>>>>>>> reaction-functionality
			puts "success"
		else
			puts "failed to update amount"
		end
	end
<<<<<<< HEAD
	def already_liked(attachment, current_user)
		if Reaction.where(user_id: current_user.id, attachment_id: attachment.id).exists?
			Reaction.where(user_id: current_user.id, attachment_id: attachment.id).first.like?
		else
			return false
		end		
	end
	def already_disliked(attachment, current_user)
		if Reaction.where(user_id: current_user.id, attachment_id: attachment.id).exists?
			Reaction.where(user_id: current_user.id, attachment_id: attachment.id).first.dislike?
		else
			return false
		end
	end
	def already_reacted(attachment, current_user)
		Reaction.where(user_id: current_user.id, attachment_id: attachment.id).exists?
	end
=======

>>>>>>> reaction-functionality
end
