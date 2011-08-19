export CLICOLOR=1;
export HOSTNAME=`hostname`
export PATH=./bin:$HOME/bin:/usr/local/bin:/usr/local/Cellar/python/2.7.1/bin:/usr/local/share/npm/bin:/usr/local/Cellar/php/5.3.5/bin:$PATH
export TZ="America/New_York"
export EDITOR='mvim'
export LC_ALL='en_US.UTF-8'

export NODE_PATH=/usr/local/lib/node
export PGOPTIONS='-c client_min_messages=WARNING'
export JRUBY_OPTS="--1.9"
export ANT_OPTS="-Xmx512m -XX:MaxPermSize=512m"

# BigBlueButton: Setup development environment
# export GROOVY_HOME=/home/firstuser/dev/tools/groovy-1.6.5
# export JAVA_HOME=/usr/lib/jvm/java-6-openjdk

# export GRAILS_HOME=/home/firstuser/dev/tools/grails-1.1.1
# export PATH=$PATH:$GRAILS_HOME/bin

export FLEX_HOME=/Users/tjsingleton/Projects/common/flex/3.4.1.10084
export PATH=$PATH:$FLEX_HOME/bin

export GRADLE_HOME=/Cellar/gradle/1.0-milestone-4
# export PATH=$PATH:$GRADLE_HOME/bin

export XUGGLE_HOME=/usr/local/xuggler
export DYLD_LIBRARY_PATH=$XUGGLE_HOME/lib:$DYLD_LIBRARY_PATH
export PATH=$XUGGLE_HOME/bin:$PATH
