class Skill < ApplicationRecord
  include Placeholder
  validates_presence_of :title, :percent_utilized

  after_initialize :set_defaults

  def set_defaults
    # shortcut for saying if self.main_image is nil then set 
    self.badge ||= Placeholder.image_generator(height:250, width:250)
  end
end
