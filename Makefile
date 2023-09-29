NAME			=	inception

SRC				=	srcs

VOL_DIR			=	~/data

ENV_FILE		=	~/Documents/env

all:	$(NAME)

clean:	down
	sudo docker system prune -af
	sudo docker network prune -f

fclean:	clean
	sudo docker volume prune -f
	sudo docker volume rm mariadb wordpress
	sudo rm -rf	$(VOL_DIR)/mariadb
	sudo rm -rf	$(VOL_DIR)/wordpress
	sudo rm -rf	$(VOL_DIR)

re:	fclean	all

$(NAME):	volume	env	build	up

volume:
	sudo mkdir -p $(VOL_DIR)
	sudo mkdir -p $(VOL_DIR)/mariadb
	sudo mkdir -p $(VOL_DIR)/wordpress

env:
	sudo cp $(ENV_FILE) $(SRC)/.env

build:
	sudo docker-compose -f $(SRC)/docker-compose.yml build

up:
	sudo docker-compose -f $(SRC)/docker-compose.yml up -d

down:
	sudo docker-compose -f $(SRC)/docker-compose.yml down
