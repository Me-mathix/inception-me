all: 
	mkdir -p /Users/mathieu/mda-cunh/data/mariadb
	mkdir -p /Users/mathieu/mda-cunh/data/wordpress
	@sudo docker compose -f ./srcs/docker-compose.yml build
	@sudo docker compose -f ./srcs/docker-compose.yml up -d

stop:
	@sudo docker compose -f ./srcs/docker-compose.yml stop

clean: stop
	@-sudo docker container stop nginx mariadb wordpress
	@-sudo docker network rm inception

fclean: clean
	@sudo rm -rf /Users/mathieu/mda-cunh/data/mariadb/*
	@sudo rm -rf /Users/mathieu/mda-cunh/data/wordpress/*
	@docker system prune -af

re: fclean all

.Phony: all logs clean fclean