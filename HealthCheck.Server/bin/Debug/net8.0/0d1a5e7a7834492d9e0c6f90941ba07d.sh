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

ps 50217;
while [ $? -eq 0 ];
do
  sleep 1;
  ps 50217 > /dev/null;
done;

for child in $(list_child_processes 50218);
do
  echo killing $child;
  kill -s KILL $child;
done;
rm /Users/cherrie/RiderProjects/HealthCheck/HealthCheck.Server/bin/Debug/net8.0/0d1a5e7a7834492d9e0c6f90941ba07d.sh;
