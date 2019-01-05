run:
	docker-compose up
test:
	docker-compose -f docker-compose-test.yml build
	docker-compose -f docker-compose-test.yml up

kill:
	-docker-compose down
	-docker-compose -f docker-compose-test.yml down
