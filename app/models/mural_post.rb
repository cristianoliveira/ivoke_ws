include ActiveModel::Serializers::JSON
class MuralPost < ActiveRecord::Base
  belongs_to :user

  reverse_geocoded_by :latitude, :longitude
  #after_validation :reverse_geocode  # auto-fetch address
 
  def as_json(options={})
    super(:include => [:user => { only: [:id ,:name, :facebook_id] }]) 
  end
end
