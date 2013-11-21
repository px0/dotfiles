require 'rake'
require 'erb'

task :default => :install

desc "install the dot files into user's home directory"
task :install do
	install_oh_my_zsh
	switch_to_zsh
	install_maximum_awesome
	install_misc
	replace_all = false
	special_files =  %w[Rakefile README.rdoc LICENSE oh-my-zsh]
	directories = Dir["*"].reject{|o| not File.directory?(o)} - special_files
	files = Dir["*"] - directories - special_files
	handle_files(files)
end

def target_file (file)
	File.join(ENV['HOME'], ".#{file.sub(/\.erb$/, '')}")
end

def handle_files(files)
	files.each do |file|
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


def install_maximum_awesome
	if File.exist?(File.join(ENV['HOME'], ".maximum-awesome"))
		puts "found ~/.maximum-awesome"
	else
		print "install .maximum-awesome? [ynq] "
		case $stdin.gets.chomp
		when 'y'
			puts "installing maximum-awesome"
			system %Q{git clone https://github.com/square/maximum-awesome.git "$HOME/.maximum-awesome"}
			system %Q{cd $HOME/.maximum-awesome && rake }
		when 'q'
			exit
		else
			puts "skipping maximum-awesome"
		end
	end
end

def install_misc
	puts "copying snippets"
	files = Dir["vim-snippets/*"]
	files.each do |file|
		puts "linking #{file}"
		system %Q{rm -rf "$HOME/.vim/snippets/#{File.basename(file)}"}
		system %Q{ln -s "$PWD/#{file}" "$HOME/.vim/snippets/#{File.basename(file)}"}	
	end
end
