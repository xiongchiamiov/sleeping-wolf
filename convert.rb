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
	
	attr_accessor :id, :title
	
	def to_s
		return "#{@id}: #{@title}"
	end
end

user = 'xiongchiamiov'
project = 'synchronizer-test'
issues = []

repo = Octopi::Repository.find(:user => user, :name => project)

repo.issues.each do |gh_issue|
	issue = Issue.new
	issue.id = gh_issue.number
	issue.title = gh_issue.title
	
	issues << issue
end

ticgit = TicGit.open('../synchronizer-test')

ticgit.ticket_list.each do |ti_issue|
	issue = Issue.new
	issue.id = ti_issue.ticket_id
	issue.title = ti_issue.title
	
	issues << issue
end

issues.each { |issue| puts issue }
