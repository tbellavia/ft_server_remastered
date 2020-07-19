.PHONY: deploy clean

deploy:
	@vagrant up

clean:
	@vagrant destroy -f services
	@vagrant destroy -f nfs

fclean: clean
	@rm -rf .vagrant