class Customer < ApplicationRecord
    has_one_attached :image
  
    validates :full_name, presence: true
    validates :email_address, format: { with: URI::MailTo::EMAIL_REGEXP, allow_blank: true }
  
    # Allow Ransack to search these fields
    def self.ransackable_attributes(auth_object = nil)
      %w[full_name phone_number email_address notes created_at updated_at]
    end
  
    # Allow Ransack to search these associations
    def self.ransackable_associations(auth_object = nil)
      %w[image_attachment image_blob]
    end
  end
  