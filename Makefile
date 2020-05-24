build:
	docker build -t EasyVMS-Stream .

run: build
	docker run --rm -p 18080:8080 EasyVMS-Stream

shell: build
	docker run --rm -ti -p 18080:8080 EasyVMS-Stream bash