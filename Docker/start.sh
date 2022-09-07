/usr/bin/supervisord  -n -c /etc/supervisor/conf.d/supervisord.conf &
while [[ "$(curl -s -o /dev/null -w ''%{http_code}'' http://localhost:80/api/v1/notifications/metadata)" != "200" ]]
do 
	echo ''
    echo ' WAIT for Spinnaker to be ready .    '
    sleep 2
    echo ''
    echo ' WAIT for Spinnaker to be ready . .  '
    sleep 2
    echo ''
    echo ' WAIT for Spinnaker to be ready . . .'
	sleep 2
done
echo '    +---------------------------------+'
echo '    |                                 |'
echo '    | Quick-Spin is ready to go!      |'
echo '    |                                 |'
echo '    | Go to: http://localhost:9000    |'
echo '    |                                 |'
echo '    | To stop Quick spin press ctrl+c |'
echo '    |                                 |'
echo '    +---------------------------------+'
wait