I like gh-issues, and its ability to allow other users to easily comment on my
project. I also like ticgit, and the fact that I have integral parts of my
project with me, even if github is unavailable. So, I want to use both!

Since we'll be making commits on behalf of other users, it won't be perfect. But
hey, let's see what we can do.

# Requirements

Scott Chacon's ticgit hasn't been updated in some time (and doesn't work with
Ruby 1.9), so you'll probably need to install from one of [the forks][1]. I used
[jeffWelling][2]'s.

ticgit currently requires ruby/git, which is deprecated in favor of grit. Until
someone fixes that, you'll need a version of ruby/git that works with ruby 1.9.
[I'm attempting][4] to maintain one. Be aware that it currently requires jeweler
to build the gem, and jeweler requires ruby/git, so you'll be overwriting the
version of ruby/git that gets pulled in by gem.  *sigh*

You'll also need [octopi][3]. Until [issue 18][5] gets fixed, you'll want to
grab [my fork][6].

[1]: http://github.com/schacon/ticgit/network
[2]: http://github.com/jeffWelling/ticgit/
[3]: http://github.com/fcoury/octopi/
[4]: http://github.com/xiongchiamiov/ruby-git
[5]: http://github.com/fcoury/octopi/issues/#issue/18
[6]: http://github.com/xiongchiamiov/octopi

# On the Name
ticgit---gh-issues-synchronizer was just too damn long a name, even if it was
descriptive. So, I went looking:

[Google][10] ->
[Wikipedia (Synchronizer)][11] ->
[Wikipedia (Synchronization][12] ->
[Wikipedia (Data Synchronization)][13] ->
[Scholarpedia (Slepian-Wolf coding)][14] -> sleeping wolf

Plus, I can have an awesomely cute logo, once I find someone to make it!

[10]: http://www.google.com/search?hl=en&q=synchronizer&aq=f&oq=&aqi=
[11]: http://en.wikipedia.org/wiki/Synchronizer
[12]: http://en.wikipedia.org/wiki/Synchronization
[13]: http://en.wikipedia.org/wiki/Data_synchronization
[14]: http://www.scholarpedia.org/article/Slepian-Wolf_coding
