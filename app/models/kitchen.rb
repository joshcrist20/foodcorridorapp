class Kitchen < ActiveRecord::Base
	extend FriendlyId
	friendly_id :host, use: :slugged

	belongs_to :user
	has_many :sales
	has_attached_file :image
	has_attached_file :resource

	validates_attachment_content_type :image, 
	content_type:  /^image\/(png|gif|jpeg)/,
	message: "Only images allowed"

	validates_attachment_content_type :resource,
	content_type: ['application/pdf'],
	message: "Only pdfs allowed"

	validates :image, attachment_presence: true
	validates :resource, attachment_presence: false

	validates_numericality_of :price,
	greater_than: 49, message: "must be at least 50 cents"
end
