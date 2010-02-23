I like gh-issues, and its ability to allow other users to easily comment on my
project. I also like ticgit, and the fact that I have integral parts of my
project with me, even if github is unavailable. So, I want to use both!

Since we'll be making commits on behalf of other users, it won't be perfect. But
hey, let's see what we can do.

# Status

sleeping-wolf is in *pre-alpha*. Although some of the structure exists, the code
that actually saves changes hasn't been written yet. This means that you can't
use it to do anything!

In addition, lots of things are hard-coded, because it was simple, and I didn't
want to deal with config files or commandline args yet. Also, I've only been
testing on my two Arch Linux machines, with Ruby 1.9; it's entirely possible any
other configuration will break horribly and kill your neighbors' puppies. You've
been warned.

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

# We Need You!

As is usual with open-source projects, any help is appreciated!  In particular:

* I'm much more of a Pythonista than a Rubyist. I've tried to catch all of the
  non-idiomatic things I tend to do (`for foo in foos` and `foo(bar)` are
  especially common), but if you spot any others, feel free to point them out!
* As mentioned above, almost everything is hardcoded, currently. Fix that and
  we'll be one step closer to someone other than me using this.
* It'd be nice to have a gh-pages branch so we can send people to a prettier
  page than this.
* A cute logo would be much appreciated, since I can't draw worth crap.
* The actual syncing code needs to be written. Right now, nothing gets saved
  back to either ticgit or gh-issues.
* The algorithms for identifying whether or not two issues are the same are
  quite simplistic.
* Comments are mostly ignored.

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
