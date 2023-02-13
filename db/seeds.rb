[{firstname: "Luke", lastname: "Skywalker"}, {firstname: "Lea", lastname: "Skywalker"}].each do |data|
  Author.find_or_create_by!(data).save
end

[{firstname: "Han", lastname: "Solo"}, {firstname: "Anakin", lastname: "Skywalker"}].each do |data|
  Talent.find_or_create_by!(data).save
end

[{name: "Deathstar", description: "How to blow it up...", author: Author.first}, {name: "Senat", description: "Why is it useful", author: Author.second}].each do |data|
  Course.find_or_create_by(data).save
end

# Connect talents to courses
courses = Course.all
talents = Talent.all
courses.each do |course|
  talents.each do |talent|
    course.talents << talent unless course.talents.include?(talent)
  end
  course.save
end
