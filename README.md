# munin
Installation of munin in a docker container
___________________________________________


building docker image:

              docker build -t server:16.04 .


creating  docker container

              ./create_docker.sh server:16.04

role apache Installation

              ansible-playbook -i hosts roles/apache.yml
