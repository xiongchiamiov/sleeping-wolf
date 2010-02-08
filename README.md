I like gh-issues, and its ability to allow other users to easily comment on my project.  I also like ticgit, and the fact that I have integral parts of my project with me, even if github is unavailable.  So, I want to use both!

Since we'll be making commits on behalf of other users, it won't be perfect.  But hey, let's see what we can do.

# Requirements

Scott Chacon's ticgit hasn't been updated in some time (and doesn't work with
Ruby 1.9), so you'll probably need to install from one of [the forks][1]. I used
[jeffWelling][2]'s.

ticgit currently requires ruby/git, which is deprecated in favor of grit. Until
someone fixes that, you'll need a version of ruby/git that works with ruby 1.9.
rrouse has [such a thing][4].

You'll also need [octopi][3].

[1]: http://github.com/schacon/ticgit/network
[2]: http://github.com/jeffWelling/ticgit/
[3]: http://github.com/fcoury/octopi/
[4]: http://github.com/rrouse/ruby-git
