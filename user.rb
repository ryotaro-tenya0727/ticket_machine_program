class User
  attr_reader :name

  def initialize(name:)
    @name = name
  end

  def self.create_users(names)
    names.map do |name|
      User.new(name: name)
    end
  end
end

names=["honi", "urumu"]

users =  User.create_users(names)

users.each do |user|
  puts user.name
end
