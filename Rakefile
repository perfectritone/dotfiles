require 'rake'
require 'erb'

DISPLAY_SERVERS = %w[wayland x11]

desc "install the dot files into user's home directory (display server: wayland (default) or x11)"
task :install, [:display_server] do |_t, args|
  display_server = args[:display_server] || 'wayland'
  abort "unknown display server '#{display_server}', expected one of: #{DISPLAY_SERVERS.join(', ')}" unless DISPLAY_SERVERS.include?(display_server)

  install_oh_my_zsh
  switch_to_zsh

  @replace_all = false
  install_dir 'local_config'
  install_dir "local_config_#{display_server}"

  print "\nWould you like to backup your package list? [yn]: "
  case $stdin.gets.chomp
  when 'y'
    backup_system_packages
  end

  puts "\nManually copy the files from `root_config` and `root_config_#{display_server}` to their respective paths from `/`"
end

namespace :install do
  DISPLAY_SERVERS.each do |display_server|
    desc "install the dot files for #{display_server}"
    task display_server do
      Rake::Task[:install].invoke(display_server)
    end
  end
end

def install_dir(dir)
  Dir.chdir dir

  all_files = Dir[File.join('**', '*')]

  files = all_files.reject { |f| File.directory?(f) }

  files.each do |file|
    system %Q{mkdir -p "$HOME/.#{File.dirname(file)}"} if file =~ /\//
    if File.exist?(File.join(ENV['HOME'], ".#{file.sub(/\.erb$/, '')}"))
      if File.identical? file, File.join(ENV['HOME'], ".#{file.sub(/\.erb$/, '')}")
        puts "identical ~/.#{file.sub(/\.erb$/, '')}"
      elsif @replace_all
        replace_file(file)
      else
        print "overwrite ~/.#{file.sub(/\.erb$/, '')}? [ynaq] "
        case $stdin.gets.chomp
        when 'a'
          @replace_all = true
          replace_file(file)
        when 'y'
          replace_file(file)
        when 'q'
          exit
        else
          puts "skipping ~/.#{file.sub(/\.erb$/, '')}"
        end
      end
    else
      link_file(file)
    end
  end

  Dir.chdir '..'
end

def replace_file(file)
  system %Q{rm -rf "$HOME/.#{file.sub(/\.erb$/, '')}"}
  link_file(file)
end

def link_file(file)
  if file =~ /.erb$/
    puts "generating ~/.#{file.sub(/\.erb$/, '')}"
    File.open(File.join(ENV['HOME'], ".#{file.sub(/\.erb$/, '')}"), 'w') do |new_file|
      new_file.write ERB.new(File.read(file)).result(binding)
    end
  else
    puts "linking ~/.#{file}"
    system %Q{ln -s "$PWD/#{file}" "$HOME/.#{file}"}
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

def backup_system_packages
  date = Time.now.strftime('%Y-%m-%d')
  filename = "pkglist-#{date}.txt"

  system %Q{pacman -Qqet > #{filename}}
  puts "\nWrote package list to #{Dir.pwd}/#{filename}"
  puts "Install this package list by running `yay -S --needed - < pkglist-YYYY-MM-DD.txt`"
end
