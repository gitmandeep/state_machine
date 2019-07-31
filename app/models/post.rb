class Post < ApplicationRecord
	include AASM

	aasm do
    state :unverified, initial: true
    state :verified
    state :published
    state :rejected
    
    event :verify do
      transitions from: [:unverified], to: :verified, after: :update_verified_at
    end
    event :reject do
      transitions from: [:unverified], to: :rejected
    end
    
    event :publish do
      transitions from: [:verified], to: :published, after: :update_published_at
    end
  end

  def update_verified_at
		self.verified_at = DateTime.now
   	self.save
	end

	def update_published_at
		self.published_at = DateTime.now
   	self.save
	end
end









	# state_machine  initial: :draft do	
	# 	after_transi	tion draft: :published, do: :update_status				
			
	# 	event :publish do
	# 		transition :draft => :published
	# 	end
 # 	end

	# def update_status
	# 	self.published_at = DateTime.now
 #   	self.status = "publish"
 #   	self.save
	# end