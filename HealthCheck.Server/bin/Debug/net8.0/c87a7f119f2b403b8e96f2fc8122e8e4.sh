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

ps 40901;
while [ $? -eq 0 ];
do
  sleep 1;
  ps 40901 > /dev/null;
done;

for child in $(list_child_processes 40904);
do
  echo killing $child;
  kill -s KILL $child;
done;
rm /Users/cherrie/RiderProjects/HealthCheck/HealthCheck.Server/bin/Debug/net8.0/c87a7f119f2b403b8e96f2fc8122e8e4.sh;
