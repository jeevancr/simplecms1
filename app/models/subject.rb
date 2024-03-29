class Subject < ActiveRecord::Base
    # delete nested pages whenever subject is deleted
    has_many :pages, :dependent => :destroy
    has_many :pages
    
    acts_as_list
#    Don't need to validate(in most cases) :
#    ids,foreign keys,timestamps,booleans,counters
    validates_presence_of :name
    validates_length_of :name, :maximum => 255
#    validates presence of vs validates_length_of :minimum => 1
#    difference error messages: "Can't be blank" or "is too short"
#    validates_length_of allows strings with only spaces!
    
    scope :visible, lambda { where(:visible => true)}
    scope :invisible, lambda { where(:visible => false)}
    scope :sorted, lambda { order("subjects.position ASC")}
    scope :newest_first, lambda { order("subjects.created_at DESC")}
    scope :search, lambda {|query|
        where(["name LIKE ?","%#{query}%"])
    }

end
