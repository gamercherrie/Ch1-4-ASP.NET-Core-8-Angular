function list_child_processes () {
    local ppid=$1;
    local current_children=$(pgrep -P $ppid);
    local local_child;
    if [ $? -eq 0 ];
    then
        for current_child in $current_children
        do
          local_child=$current_child;
          list_child_processes $local_child;
          echo $local_child;
        done;
    else
      return 0;
    fi;
}

ps 31454;
while [ $? -eq 0 ];
do
  sleep 1;
  ps 31454 > /dev/null;
done;

for child in $(list_child_processes 31458);
do
  echo killing $child;
  kill -s KILL $child;
done;
rm /Users/cherrie/RiderProjects/HealthCheck/HealthCheck.Server/bin/Debug/net8.0/a01e7c46c9a7429ebbdf1faffdeb2a9c.sh;
