# Munin
Installation of munin in a docker container
___________________________________________
Munin is a networked resource monitoring tool that can help analyze resource trends and "what just happened to kill our performance?" problems. It is designed to be very plug and play. A default installation provides a lot of graphs with almost no work.


## Munin architecture

![imagen](https://user-images.githubusercontent.com/21178320/33304130-1882f6cc-d3d5-11e7-917b-73e7e17494c3.png)

________________________________________________________________________________________________________________________

## Munin-Master

The master is responsible for all central Munin-related tasks.


### Role

The munin master is responsible for gathering data from munin nodes. It stores this data in RRD [1], files, and graphs them on request. It also checks whether the fetched values fell below or go over specific thresholds (warning, critical) and will send alerts if this happens and the administrator configured it to do so.


## Munin-Node

The node is a small agent running on each monitored host.


### Role

The munin node is installed on all monitored servers. It accepts connections from the munin master, and runs plugins on demand.

________________________________________________________________________________________________________________________

#### step by step

building docker image:

              docker build -t server:16.04 .


creating  docker container

              ./create_docker.sh server:16.04


#### role apache Installation

              ansible-playbook -i hosts roles/apache.yml
output

![imagen](https://user-images.githubusercontent.com/21178320/33262376-086a3bca-d334-11e7-9f5e-de0f87924a46.png)

apache running

![imagen](https://user-images.githubusercontent.com/21178320/33262867-c29e0ab6-d335-11e7-9dc7-26036f6588de.png)

___________________________________________________________________________________________________________________

#### role munin installation

              ansible-playbook -i hosts roles/munin.yml

output

![imagen](https://user-images.githubusercontent.com/21178320/33307489-ad5b00a0-d3e4-11e7-8a9a-7d24d8071b53.png)



#### role munin-node installation

              ansible-playbook -i hosts roles/munin-node.yml

output

![imagen](https://user-images.githubusercontent.com/21178320/33308355-1e83b36e-d3e8-11e7-9a27-668acb6d3f22.png)


munin running

![imagen](https://user-images.githubusercontent.com/21178320/33335157-3fe8c63c-d43a-11e7-9710-1200dbb8ca0e.png)

_____________________________________________________________________________________________

## Jmeter

The Apache JMeter™ application is open source software, a 100% pure Java application designed to load test functional behavior and measure performance. It was originally designed for testing Web Applications but has since expanded to other test functions. 


## Jmeter installation

              apt-get install jmeter


### Jmeter installed

![imagen](https://user-images.githubusercontent.com/21178320/33472925-4810a320-d642-11e7-893d-174fb2925a2f.png)

_____________________________________________________________________________________________

Using Jmeter we are able to test a webpage, in this case I created a web page which can be accesed in http://localhost/testing, by configuring apache2.


#### Apache configuration file 

![imagen](https://user-images.githubusercontent.com/21178320/33473313-ed88d39e-d643-11e7-85a4-a919af14cecc.png)


#### Web site for test

![imagen](https://user-images.githubusercontent.com/21178320/33473186-6875ca54-d643-11e7-94d9-0b2c7b19dbb4.png)


##### followed by that, we proceed to create the different tests to the web page by configuring Jmeter


#### 1 Thread (user), 10 HTTP requests

![imagen](https://user-images.githubusercontent.com/21178320/33473882-2cd1d864-d646-11e7-9cfc-aab7e443d8ba.png)


#### 10 Threads (users), 10 HTTP requests

![imagen](https://user-images.githubusercontent.com/21178320/33474194-8995ed78-d647-11e7-9e25-540ecbf90963.png)

#### 10 Threads (users), 100 HTTP requests

![imagen](https://user-images.githubusercontent.com/21178320/33474457-a4255812-d648-11e7-80fc-f34df5c46b5b.png)


### Interpreting the Results

You will probably see that the Status of all the requests is "Success" (indicated by a green triangle with a checkmark in it). After that, the columns that you are probably most interest in are the Sample Time (ms) and Latency (not displayed in example) columns.

	    Latency: The number of milliseconds that elapsed between when JMeter sent the request and when an initial response was received

	    Sample Time: The number of milliseconds that the server took to fully serve the request (response + latency)


According to the tables that ware generated, the average Sample Time in the first table was 10, in the second table was 19 ms and in the last table was 14 ms. This is a reasonable response time for a basic homepage (which was about 3093 KB). If your web application server is not struggling for resources, as demonstrated in the example, your Sample Time will be influenced primarily by geographical distance (which generally increases latency) and the size of the requested item (which increases transfer time). 

So, the server survived our simulation of 1 and 10 users, performing 10, 100 and 1000 HTTP requets accessing the 3093 KB homepage over 8 seconds (125 every second) in the caseof the last table, with an acceptable response.




