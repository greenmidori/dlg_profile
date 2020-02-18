module Memory
  class UsersRepository
    def initialize
      @users = { }
      @next_id = 1
    end
    
    def save(user)
      user.id = next_id
      users[next_id] = user
      @next_id += 1
      
      user
    end
    
    def all
      users
    end
    
    def first
      first_key = users.keys.sort.first
      users[first_key]
    end
    
    def last
      last_key = users.keys.sort.last
      users[last_key]
    end
    
    private
    attr_reader :users, :next_id
  end
end
