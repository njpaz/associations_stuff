class Skill < ActiveRecord::Base
  has_many :skillsets
  has_many :users, through: :skillsets
  validates :name, uniqueness: true

  def user_with_proficiency(rating)
    skill_id = self.id
    skillset = Skillset.where(skill_id: skill_id, proficiency: rating).first
    user_id = skillset.user_id
    User.where(id: user_id).first
  end
end
