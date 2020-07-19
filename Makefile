.PHONY: deploy clean

RED		= \033[0;31m
GREEN	= \033[0;32m
NC		= \033[0m

all: deploy

deploy:
	@printf "$(GREEN)Deploying virtual machines$(NC)\n"
	@vagrant up

clean:
	@printf "$(RED)Removing : \n\tvirtual machines$(NC)\n"
	@vagrant destroy -f services
	@vagrant destroy -f nfs

fclean: clean
	@printf "$(RED)Removing : \n\t.vagrant configuration$(NC)\n"
	@rm -rf .vagrant