class TalentResource < JSONAPI::Resource
  attributes :firstname, :lastname

  has_many :courses
  filter :courses
end
