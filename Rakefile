require 'rake'
require 'erb'

$prefix = "."

desc "install the dot files into user's home directory"
task :install do
	install_oh_my_zsh
	switch_to_zsh
	replace_all = false
	special_files =  %w[Rakefile README.rdoc LICENSE oh-my-zsh custom extras bin]
	directories = Dir["*"].reject{|o| not File.directory?(o)} - special_files
	files = Dir["*"] - directories - special_files
	handle_files(files, ".")
	recursively_handle_directories(directories)
end

def recursively_handle_directories(directories, dirstack)
	$prefix = ""
	directories.each do |dir|
		Dir.chdir(dir) do
			dirstack = File.join(dirstack, dir)
			puts "In #{Dir.pwd}..."
			directories = Dir["*"].reject{|o| not File.directory?(o)} 
			files = Dir["*"] - directories
			handle_files files, dirstack unless files.empty?
			recursively_handle_directories directories, dirstack unless directories.empty?
		end
	end
end

def target_file (file)
	File.join(ENV['HOME'], $prefix+"#{file.sub(/\.erb$/, '')}")
end

def handle_files(files, dirstack)
	proper_dirstack = 
	files = files.map{|f| File.join(dirstack.sub('/','./'), f} #replace first subdirectory with dot-subdir and use dirstack
	files.each do |file|
		puts ">"+file
		# system %Q{mkdir -p "$HOME/.#{File.dirname(file)}"} if file =~ /\//
		if File.exist?(target_file file)
			if File.identical?(file, target_file(file))
				puts "identical #{target_file file}"
			elsif replace_all
				replace_file(file)
			else
				print "overwrite #{target_file file}? [ynaq] "
				case $stdin.gets.chomp
				when 'a'
					replace_file(file)
				when 'y'
					replace_file(file)
				when 'q'
					exit
				else
					puts "skipping #{target_file file}"
				end
			end
		else
			link_file(file)
		end
	end
end

def replace_file(file)
	system %Q{rm -rf #{target_file file}"}
	link_file(file)
end

def link_file(file)
	if file =~ /.erb$/
		puts "generating ~/#{file.sub(/\.erb$/, '')}"
		File.open(target_file file, 'w') do |new_file|
			new_file.write ERB.new(File.read(file)).result(binding)
		end
	else
		puts "linking ~/.#{file}"
		system %Q{ln -s "$PWD/#{file}" #{target_file file}}
	end
end

def switch_to_zsh
	if ENV["SHELL"] =~ /zsh/
		puts "using zsh"
	else
		print "switch to zsh? (recommended) [ynq] "
		case $stdin.gets.chomp
		when 'y'
			puts "switching to zsh"
			system %Q{chsh -s `which zsh`}
		when 'q'
			exit
		else
			puts "skipping zsh"
		end
	end
end

def install_oh_my_zsh
	if File.exist?(File.join(ENV['HOME'], ".oh-my-zsh"))
		puts "found ~/.oh-my-zsh"
	else
		print "install oh-my-zsh? [ynq] "
		case $stdin.gets.chomp
		when 'y'
			puts "installing oh-my-zsh"
			system %Q{git clone https://github.com/robbyrussell/oh-my-zsh.git "$HOME/.oh-my-zsh"}
		when 'q'
			exit
		else
			puts "skipping oh-my-zsh, you will need to change ~/.zshrc"
		end
	end
end

def install_snippets
	system %Q{curl -o $HOME/.vim/snippets/ruby.snippets https://raw.github.com/kaichen/vim-snipmate-ruby-snippets/master/ruby.snippets}
end
