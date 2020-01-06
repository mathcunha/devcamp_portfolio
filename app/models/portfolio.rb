class Portfolio < ApplicationRecord
  has_many :technologies, dependent: :destroy
  accepts_nested_attributes_for :technologies, reject_if: lambda {|attrs| attrs['name'].blank?}

  include Placeholder
  validates_presence_of :title, :subtitle, :body

  def self.angular
    where.(subtitle: 'angular')
  end

  scope :dathomirian, -> {where(subtitle:'Dathomirian')}

  after_initialize :set_defaults

  def set_defaults
    # shortcut for saying if self.main_image is nil then set 
    self.main_image ||= Placeholder.image_generator(height:600, width:400)
    self.thumb_image ||= Placeholder.image_generator(height:350, width:200)
  end
end
