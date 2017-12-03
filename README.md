# Span


For the busy or forgetful people who want to keep track of their belongings.
This project is centered around the idea that our belongings have a lifespan and aims at notifying when they're reaching [EOL](https://en.wikipedia.org/wiki/End-of-life_(product))

## Current Implementation

* Powered by Phoenix
* Containerized using Docker
* Data exposed using Graphql (absinthe)

## Installation

### First Time

#### Clone the Repo

`git clone https://github.com/benjaminshafii/Span`


### Create a docker network

`docker network create span`

### Launch project
`sh ./init.sh`

## Using it

`docker-compose up`

### Using it

Go to `http://localhost:4000/graphiql`

Use the following to get a token
```
mutation Login {
  login(email: "ben@ben.com", password:"password")
}
```

Copy your token (without the double quotes)

In the query params on top change the URL section to:

`http://localhost:4000/api`

then in the `Headers` section click on `Standard` -> `Oauth2 Bearer Token`
and place your token after `Bearer`. It should look like this

```
Name: Authoriztion

Value: Bearer xxxxx
```

where xxxxx is your token

## Useful Commands
Running your project 

The following command is similar to using the Rails `console` or the Django `shell`

`docker-compose run web iex -S mix`

## License
MIT
