class User < ApplicationRecord
    validates_uniqueness_of :username 

    def self.generate
        adjectives = ['Super', 'Hyper', 'Master', 'Ultra', 'Ultimate', 'Regular']
        nouns = ['Movie', 'Table', 'Computer', 'Food', 'Money']
        number = rand.to_s[2..4]
        username = "#{adjectives.sample}-#{nouns.sample}-#{number}"
        create(username: username)
    end
end
