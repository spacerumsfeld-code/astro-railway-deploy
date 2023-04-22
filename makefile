##### Development #####

make dev:
	@echo "Starting development server..."
	npx astro dev

make start:
	@echo "Starting production server..."
	npx astro start

make preview:
	@echo "Starting preview server..."
	npx astro preview

make build:
	@echo "Building production files..."
	npx astro build

##### Containerization #####

make docker-build:
	@echo "Building docker image..."
	docker build -t astro-app .

make docker-run:
	@echo "Running docker image..."
	docker run -p 80:80 -d astro-app