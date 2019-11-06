class Project
    attr_reader :creator
    attr_accessor :pledge_goal
    @@all = [] 
    def initialize(creator,pledge_goal)
        @creator = creator #user instances 
        @pledge_goal = pledge_goal
        @@all <<self
    end 

    def pledge(user, amount)#a user pledges for this project
        Pledge.new(user,self, amount)
    end

    def project_pledges #[ ] of pledges to self
        Pledge.all.select{|pledge| pledge.project == self}
    end

    def current_total
        project_pledges.reduce(0){|sum, pledge| sum +=pledge.amount}    
    end

    def self.no_pledge 
        @@all.select{|project| project.current_total == 0} 
    end

    def self.above_goal
        @@all.select{|project| project.curent_total>= project.pledge_goal}
    end

    def backers 
        project_pledges.map{|pledge| pledge.user}
    end

    def self.most_backers
       @@all.max_by{|project| project.backers.size} 
    end
end