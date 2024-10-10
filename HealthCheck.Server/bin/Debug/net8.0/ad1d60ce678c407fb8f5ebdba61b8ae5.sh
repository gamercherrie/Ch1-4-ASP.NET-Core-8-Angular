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

ps 39291;
while [ $? -eq 0 ];
do
  sleep 1;
  ps 39291 > /dev/null;
done;

for child in $(list_child_processes 39292);
do
  echo killing $child;
  kill -s KILL $child;
done;
rm /Users/cherrie/RiderProjects/HealthCheck/HealthCheck.Server/bin/Debug/net8.0/ad1d60ce678c407fb8f5ebdba61b8ae5.sh;
