#Dockefile for creating a docker image : Ubuntu + Apache + Pyhton + Flask
#Commnet
FROM ubuntu:latest

RUN apt-get update
RUN apt-get install -y python3 python3-pip wget 

RUN apt-get install -y lynx

RUN apt-get install sudo 

RUN sudo apt install -y vim

RUN sudo pip3 install Flask
RUN pip3 install Flask-SqlAlchemy
EXPOSE 8000

WORKDIR  /home

RUN  mkdir -pv /home/templates/
ADD app1.py /home
ADD app2.py /home
ADD app3.py /home
ADD app4.py /home
RUN chmod +x /home/app4.py
ADD dummy.py /home
ADD tabledef.py /home
RUN /usr/bin/python3  tabledef.py
RUN /usr/bin/python3  dummy.py
 
ADD index.html /home/templates
ADD login1.html /home/templates
ADD index.html /home/templates
ADD index.html /tmp
RUN mkdir -pv /home/static/
ADD style.css /home/static
#ADD  /sbin/ifconfig /home
#ENTRYPOINT ["/usr/bin/python", "app4.py"]
ENTRYPOINT ["nohup", "/usr/bin/python3","/home/app4.py", "&"]
#Added comment to checkin the file.
