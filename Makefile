install:
	brew bundle

open:
	vapor xcode

build:
	vapor build

clean:
	vapor clean

run:
	vapor run migrate
	vapor run routes
	vapor run serve --port 8081

lint:
	swiftformat .
	swiftlint
