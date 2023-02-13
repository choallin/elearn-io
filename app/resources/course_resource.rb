class CourseResource < JSONAPI::Resource
  attributes :name, :description
  has_one :author
  has_many :talents

  filter :name
end
