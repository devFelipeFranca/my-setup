sudo docker build -t ssh-container .
sudo docker run -d -p 2222:22 --name ssh-container ssh-container
ssh root@localhost -p 2222

