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
	
	attr_accessor :title
	attr_accessor :comments # arrays
	
	def initialize
		@comments = []
	end
	
	def to_s
		s = "#{@title}"
		@comments.each {|comment| s << "\n\t#{comment}"}
		
		return s
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

user = 'xiongchiamiov'
project = 'synchronizer-test'
issues = []

repo = Octopi::Repository.find(:user => user, :name => project)

repo.issues.each do |gh_issue|
	issue = Issue.new
	issue.title = gh_issue.title
	
	comment = Comment.new
	comment.text = gh_issue.body
	issue.comments << comment
	
	issues << issue
end

ticgit = TicGit.open('../synchronizer-test')

ticgit.ticket_list.each do |ti_issue|
	issue = Issue.new
	issue.title = ti_issue.title
	ti_issue.comments.each {|comment| issue.comments << Comment.new(comment)}
	
	issues << issue
end

issues.each { |issue| puts issue }
