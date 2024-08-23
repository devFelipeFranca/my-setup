sudo docker stop $(sudo docker ps -a -q)
sudo docker rm $(sudo docker ps -a -q)
sudo docker rmi $(sudo docker images -q)
sudo docker system prune -a
sudo ssh-keygen -f '/home/ff/.ssh/known_hosts' -R '[localhost]:2222'
