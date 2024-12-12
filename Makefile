all: 
	mkdir -p /home/mda-cunh/data/mariadb
	mkdir -p /home/mda-cunh/data/wordpress
	@docker compose -f ./srcs/docker-compose.yml build
	@docker compose -f ./srcs/docker-compose.yml up -d

stop:
	@docker compose -f ./srcs/docker-compose.yml stop

clean:
	docker compose -f srcs/docker-compose.yml down --rmi all --volumes --remove-orphans

re: clean

.Phony: all clean re
