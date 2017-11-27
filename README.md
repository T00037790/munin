# munin
Installation of munin in a docker container
___________________________________________
Munin is a networked resource monitoring tool that can help analyze resource trends and "what just happened to kill our performance?" problems. It is designed to be very plug and play. A default installation provides a lot of graphs with almost no work.



building docker image:

              docker build -t server:16.04 .


creating  docker container

              ./create_docker.sh server:16.04


role apache Installation

              ansible-playbook -i hosts roles/apache.yml
