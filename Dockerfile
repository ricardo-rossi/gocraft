# Build:	docker build -t "meetup-server" .
# Run: 		docker run -p 3000:3000 -d meetup-server

FROM iron/go:dev
MAINTAINER Ricardo Rossi <ricardo@endata.com>

ADD . /go/src/github.com/ricardo-rossi/meetup
ADD ./server /go/src/github.com/ricardo-rossi/meetup/server

WORKDIR /go

RUN go get -t -d -v ./...
RUN go test -v github.com/ricardo-rossi/meetup
RUN go build -v -o /go/bin/server github.com/ricardo-rossi/meetup/server

EXPOSE 3000:3000
ENV PORT 3000

CMD ["/go/bin/server"]
