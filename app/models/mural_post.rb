class MuralPost < ActiveRecord::Base
  belongs_to :usuario

  def as_json(options={})
  super(:only => [:message,:usuario_id,:posted_at],
        :include => {
          :usuario => {:only => [:nome]}
        }
     )
  end
end
