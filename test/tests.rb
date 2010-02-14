require 'shoulda'
$LOAD_PATH.unshift File.dirname(__FILE__) + '/../lib'
require 'sleeping-wolf'

class WolfTest < Test::Unit::TestCase
	context "The test repository" do
		setup do
			@user = 'xiongchiamiov'
			@project = 'synchronizer-test'
			@test_repository = '../synchronizer-test'
			@gh_issues = retrieve_from_gh_issues(@user, @project)
			@ticgit_issues = retrieve_from_ticgit(@test_repository)
		end
		
		should 'retrieve 2 issues from gh-issues' do
			assert_equal 2, @gh_issues.length
		end
		
		should 'retrieve 2 issues from ticgit' do
			assert_equal 2, @ticgit_issues.length
		end
		
		context 'gh-issue #2' do
			setup do
				@issue = @gh_issues[0]
			end
			
			should 'have the correct issue information' do
				assert_equal [], @issue.labels
				assert_equal 2, @issue.id
				assert_equal 'gh-issues test #2', @issue.title
				assert_equal '2010-02-07', @issue.date_opened.strftime('%Y-%m-%d')
				assert_equal 'open', @issue.state
			end
		end
		
		context 'gh-issue #1' do
			setup do
				@issue = @gh_issues[1]
			end
			
			should 'have the correct issue information' do
				assert_equal ["gh-issues label#1", "gh-issues label#2"], @issue.labels
				assert_equal 1, @issue.id
				assert_equal 'gh-issues test #1', @issue.title
				assert_equal '2010-02-07', @issue.date_opened.strftime('%Y-%m-%d')
				assert_equal 'closed', @issue.state
			end
		end
		
		context 'ticgit-issue #1' do
			setup do
				@issue = @ticgit_issues[0]
			end
			
			should 'have the correct issue information' do
				assert_equal [], @issue.labels
				assert_equal 'afbe519a76137ea4e1ed8f53a6b75c7e602087ab', @issue.id
				assert_equal 'ticgit issue #1', @issue.title
				assert_equal '2010-02-08', @issue.date_opened.strftime('%Y-%m-%d')
				assert_equal 'open', @issue.state
			end
		end
		
		context 'ticgit-issue #2' do
			setup do
				@issue = @ticgit_issues[1]
			end
			
			should 'have the correct issue information' do
				assert_equal [], @issue.labels
				assert_equal 'bd6f3184644f6ef3a50d2bc92ce6baa1609cce31', @issue.id
				assert_equal 'ticgit issue #2', @issue.title
				assert_equal '2010-02-08', @issue.date_opened.strftime('%Y-%m-%d')
				assert_equal 'open', @issue.state
			end
		end
		
		context 'might_equal?' do
			setup do
				@issue = Issue.new
				@issue.id = 1
				@issue.title = 'Lorem Ipsum'
				@issue.labels = []
				@issue.date_opened = Time.parse('2010-01-01')
				@issue.state = 'open'
				@issue.comments = []
				
				@modified_issue = @issue.clone
			end
			
			should 'fuzzy-equal itself with the correct certainty' do
				assert_equal 100, @issue.might_equal?(@issue)
			end
			
			should 'fuzzy-equal itself with the correct certainty with title changed' do
				@modified_issue.title = 'Dolor Sit Amet'
				assert_equal 80, @issue.might_equal?(@modified_issue)
			end
			
			should 'fuzzy-equal itself with the correct certainty with date changed' do
				@modified_issue.date_opened = Time.parse('2000-01-01')
				assert_equal 80, @issue.might_equal?(@modified_issue)
			end
			
			should 'fuzzy-equal itself with the correct certainty with state changed' do
				@modified_issue.state = 'closed'
				assert_equal 90, @issue.might_equal?(@modified_issue)
			end
			
			should 'fuzzy-equal itself with the correct certainty with comments changed' do
				comment = Comment.new
				comment.text = 'foo comment'
				@modified_issue.comments = [comment]
				assert_equal 70, @issue.might_equal?(@modified_issue)
			end
			
			should 'fuzzy-equal itself with the correct certainty with labels changed' do
				@modified_issue.labels = ['foo-label']
				assert_equal 80, @issue.might_equal?(@modified_issue)
			end
		end
	end
end
