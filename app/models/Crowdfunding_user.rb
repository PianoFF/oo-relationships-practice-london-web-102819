class User
    attr_reader :name 
    @@all = [ ] 
    def initialize (name)
        @name = name 
        @@all << self
    end

    def pledges #pledge by user
        Pledge.all.select{|pledge| pledge.user == self}
    end

    def pledge_amount #total of pledges = int.
        pledges.reduce(0){|sum, pledge| sum + pledge.amount}
    end

    def self.highest_pledge #user contributed the most in total
        @@all.max_by{|user|user.pledge_amount}
    end

    def self.single_transaction # highest single pledge user
        Pledge.all.max_by{|pledge| pledge.amount}.user
    end

    def self.multi_pleder
        @@all.select{|user| user.pledges.size >1}
    end

    def projects_created_by_user
        Project.all.select{|project| project.creator == self}
    end

    def self.project_creater
        @@all.select{|user| user.projects_created_by_user !=[ ]}
    end
end