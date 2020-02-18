class UserCreator
  attr_reader :params
  attr_reader :user

  def initialize(params)
    @params = params
    @user_created = false
  end

  def create_user
    @user = User.new(params)

    if user.valid?
      user_repo.save(user)
      @user_created = true
    end
  end

  def user_repo
    RepositoryLocator.repository_for(:user)
  end
    
