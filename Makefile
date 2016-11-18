DOCKER_NAME=iot-mqttd
PUSH_NAME=registry.co/nebula/${DOCKER_NAME}

build:
	docker build -t ${DOCKER_NAME} .

push:
	docker tag ${DOCKER_NAME} ${PUSH_NAME} && docker push ${PUSH_NAME}
