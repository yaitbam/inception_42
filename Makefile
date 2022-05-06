#!make
include srcs/.env 

NAME		=	inception

COMPOSE		=	cd srcs && docker-compose -p $(NAME)

RM			=	rm -rf

SUDO		=	sudo

MAKE_DIR	=	$(SUDO) mkdir -m 777 -p

CHMOD		=	$(SUDO) chmod -R 777

CHOWN		=	$(SUDO) chown -R yait-bam

all: .up

.up:
	$(MAKE_DIR) $(MARIADB_HOST_VOLUME_PATH)
	$(MAKE_DIR) $(WORDPRESS_HOST_VOLUME_PATH)
	$(MAKE_DIR) $(BACKUP_VOLUME_PATH)
	$(CHOWN) $(DATA_VOLUME_PATH)
	$(CHMOD) $(DATA_VOLUME_PATH)
	$(SUDO) docker network create inception_network
	$(COMPOSE) up -d --build

clean:
	if docker network rm inception_network; then echo "No network to remove"; fi
	$(COMPOSE) stop

fclean:	clean
	$(COMPOSE) down -v
	if docker rmi -f $$(docker images -qa); then echo "No image to remove"; fi

re:		prune all

prune:	fclean
	docker system prune --volumes --force --all
	if $(SUDO) $(RM) $(DATA_VOLUME_PATH); then echo "No data folder to remove"; fi

.PHONY: all .up clean fclean re prune