# Customize to your needs...
export ANDROID_HOME=/usr/local/opt/android-sdk
export PATH=$ANDROID_HOME/platform-tools:$ANDROID_HOME/bin:$ANDROID_HOME/tools:$PATH
export NODE_PATH=/usr/local/lib/node_modules
# export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.7.0_45.jdk/Contents/Home"
export JAVA_HOME=`/usr/libexec/java_home`
#racket
export PATH=$PATH:"/Applications/Racket v6.2.1/bin":
export PATH=$HOME/dotfiles/bin:$HOME/bin/:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/.rvm/bin:/usr/local/share/npm/bin:/Applications/Emacs.app/Contents/MacOS/bin:/usr/local/Cellar/ruby193/1.9.3-p547/bin:$HOME/anaconda/bin:$PATH:

#pepper
export PYTHONPATH=${PYTHONPATH}:~/Dropbox/Work/labs/pepper/Mac\ OS\ X/Python\ SDK/pynaoqi-python2.7-2.4.3.28-mac64/
export DYLD_LIBRARY_PATH=${DYLD_LIBRARY_PATH}:~/Dropbox/Work/labs/pepper/Mac\ OS\ X/Python\ SDK/pynaoqi-python2.7-2.4.3.28-mac64/