.PHONY: dev-run dev-build dev-kill

dev-run:
	docker compose up

dev-build:
	docker compose build

dev-kill:
	docker compose down -v
