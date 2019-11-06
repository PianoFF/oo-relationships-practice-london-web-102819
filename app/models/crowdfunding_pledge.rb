class Pledge
   
    attr_reader :user, :project, :amount
    @@all = [ ] 
    def initialize (user, project, amount)
        @user = user
        @amount = amount 
        @project = project
        @@all << self
    end

end
