#!../../../bin/bashi

launchTime=`date +"%F__%T"`

reportFile="report"
mkdir ~/test && echo "catalog test was created successfully" >> ~/$reportFile && touch ~/test/$launchTime ; ping -c 1 www.net_nikogo.ru || echo `date +"%F__%T Ping has failed!"` >> ~/$reportFile 
