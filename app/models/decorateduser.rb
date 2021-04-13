# this was origionally in user.rb but moved here to allow
# this class to become a decorator and any other decorations
# to become decoupled from user.rb, to become closed yet open
# for extention elswhere
class Decorateduser
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def users_full_name
    "#{@user.first_name} #{@user.last_name}"
  end

  def name_with_initial
    "#{(@user.first_name).first}.#{@user.last_name}"
  end
end
