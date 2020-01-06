class Portfolio < ApplicationRecord

  validates_presence_of :title, :subtitle, :body

  def self.angular
    where.(subtitle: 'angular')
  end

  scope :dathomirian, -> {where(subtitle:'Dathomirian')}

  after_initialize :set_defaults

  def set_defaults
    # shortcut for saying if self.main_image is nil then set 
    self.main_image ||= "http://placehold.it/600x400"
    self.thumb_image ||= "http://placehold.it/350x200"
  end
end
