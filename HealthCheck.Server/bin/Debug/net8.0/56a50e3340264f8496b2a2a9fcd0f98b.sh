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

ps 20358;
while [ $? -eq 0 ];
do
  sleep 1;
  ps 20358 > /dev/null;
done;

for child in $(list_child_processes 20359);
do
  echo killing $child;
  kill -s KILL $child;
done;
rm /Users/cherrie/RiderProjects/HealthCheck/HealthCheck.Server/bin/Debug/net8.0/56a50e3340264f8496b2a2a9fcd0f98b.sh;
