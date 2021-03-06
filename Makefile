.PHONY: build kill

build:
	sudo docker build -t pytox_image .

kill:
	- sudo docker stop pytox
	- sudo docker rm pytox

run: kill build
	sudo docker run -i -t --name pytox pytox_image bash

test: kill build
	sudo docker run -t --name pytox pytox_image bash -c "cd PyTox && tox"

echobot: kill build
	sudo docker run -t --name pytox pytox_image python PyTox/examples/echo.py

