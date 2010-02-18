require 'ticgit'
require 'octopi'

class Issue
	# from ticgit
	#attr_accessor :id, :name, :title, :state, :milestone, :assigned
	#attr_accessor :opened, :points
	#attr_accessor :comments, :tags, :attachments #arrays
	
	# from octopi
	#attr_accessor :repository, :user, :updated_at, :votes, :number, :title
	#attr_accessor :body, :closed_at, :labels, :state, :created_at
	
	attr_accessor :gh_issues_id, :ticgit_id # not syncable information
	attr_accessor :title, :date_opened, :state
	attr_accessor :comments, :labels # arrays
	
	def initialize
		@comments = []
		@labels = []
	end
	
	def to_s
		s = "#{@title} (#{@state}) -- #{@date_opened.strftime '%Y-%m-%d'}"
		s << "\n\tlabels: #{@labels.join ', '}"
		@comments.each {|comment| s << "\n\t#{comment}"}
		
		return s
	end
	
	def might_equal?(issue)
		probability = 0
		
		#              v--- these weights need to add up to 1
		probability += 0.20 * (@title.might_equal? issue.title)
		probability += 0.20 * (@date_opened.might_equal? issue.date_opened)
		probability += 0.10 * (@state.might_equal? issue.state)
		probability += 0.30 * (@comments.might_equal? issue.comments)
		probability += 0.20 * (@labels.might_equal? issue.labels)
		
		return probability
	end
end

class Comment
	attr_accessor :text
	
	def initialize(comment=nil)
		@text = comment.comment if !comment.nil?
	end
	
	def to_s
		return @text
	end
end

class Array
	def might_include?(issue)
		self.each { |i| return true if (i.might_equal? issue) == 100 }
		return false
	end
	
	def might_equal?(array)
		# this'll need to be a bit more sophisticated than just checking length
		if self.length == array.length
			return 100
		else
			return 0
		end
	end
	
	def combine(list)
		issues = Array.new(self)
		
		# do some fancy equality checks to merge the lists together, without duplicates
		# first item gets priority, which should be mentioned somewhere....
		list.each do |issue|
			issues << issue if !issues.might_include? issue
		end
		
		return issues
	end
	
	def save_to_ticgit(path)
		
	end
	
	def save_to_gh_issues(user, project)
		
	end
end

class String
	def might_equal?(string)
		if self == string
			return 100
		else
			return 0
		end
	end
end

class Time
	def might_equal?(date)
		if self == date
			return 100
		else
			return 0
		end
	end
end

def retrieve_from_gh_issues(user, project)
	issues = []
	repo = Octopi::Repository.find(:user => user, :name => project)
	
	repo.all_issues.each do |gh_issue|
		issue = Issue.new
		issue.gh_issues_id = gh_issue.number
		issue.title = gh_issue.title
		issue.labels = gh_issue.labels
		issue.date_opened = gh_issue.created_at
		issue.state = gh_issue.state
		
		comment = Comment.new
		comment.text = gh_issue.body
		issue.comments << comment
		
		issues << issue
	end
	
	return issues
end

def retrieve_from_ticgit(path)
	issues = []
	ticgit = TicGit.open(path)
	
	ticgit.ticket_list.each do |ti_issue|
		issue = Issue.new
		issue.ticgit_id = ti_issue.ticket_id
		issue.title = ti_issue.title
		issue.labels = ti_issue.tags
		issue.date_opened = ti_issue.opened
		issue.state = ti_issue.state
		ti_issue.comments.each {|comment| issue.comments << Comment.new(comment)}
		
		issues << issue
	end
	
	return issues
end
