# munin
Installation of munin in a docker container
___________________________________________
Munin is a networked resource monitoring tool that can help analyze resource trends and "what just happened to kill our performance?" problems. It is designed to be very plug and play. A default installation provides a lot of graphs with almost no work.


## Munin-Master

The master is responsible for all central Munin-related tasks.


### Role

The munin master is responsible for gathering data from munin nodes. It stores this data in RRD [1], files, and graphs them on request. It also checks whether the fetched values fell below or go over specific thresholds (warning, critical) and will send alerts if this happens and the administrator configured it to do so.


## Munin-Node

The node is a small agent running on each monitored host.


### Role

The munin node is installed on all monitored servers. It accepts connections from the munin master, and runs plugins on demand.




building docker image:

              docker build -t server:16.04 .


creating  docker container

              ./create_docker.sh server:16.04


role apache Installation

              ansible-playbook -i hosts roles/apache.yml
output

![imagen](https://user-images.githubusercontent.com/21178320/33262376-086a3bca-d334-11e7-9f5e-de0f87924a46.png)

apache running

![imagen](https://user-images.githubusercontent.com/21178320/33262867-c29e0ab6-d335-11e7-9dc7-26036f6588de.png)
