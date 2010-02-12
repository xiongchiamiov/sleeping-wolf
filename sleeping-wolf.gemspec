Gem::Specification.new do |s|
	s.name = 'sleeping-wolf'
	s.version = '0.0.1'
	
	s.summary = 'A synchronizer for gh-issues and ticgit.'
	s.description = 'A synchronizer for gh-issues and ticgit.'
	s.homepage = 'http://github.com/xiongchiamiov/sleeping-wolf/'
	
	s.authors = ['James Pearson']
	s.email = 'xiong.chiamiov@gmail.com'
	
	s.files = %w[LICENSE Rakefile README.md bin/sleeping-wolf lib/sleeping-wolf.rb]
	s.extra_rdoc_files = %w[LICENSE README.md]
	s.bindir = 'bin'
	s.executables = %w[sleeping-wolf]
	
	s.add_dependency 'ticgit'
	s.add_dependency 'octopi'
	s.add_development_dependency 'rake'
	s.add_development_dependency 'mg'
end
