class Recipe < ActiveRecord::Base
  has_and_belongs_to_many :cuisines
  has_and_belongs_to_many :food_types
  has_and_belongs_to_many :preferences
  validates :name, :servings, :preparation_time, :difficulty,
            :ingredients, :steps, presence: true

  validates :difficulty, inclusion: { in: Difficulty::TYPES,
                                      message: '%{value} não é válido' }

  has_attached_file :photo, styles: { medium: '300x300>', thumb: '100x100>' },
                            default_url: '/images/:style/missing-photo.png'
  validates_attachment_content_type :photo, content_type: %r{\Aimage\/.*\Z}
end
