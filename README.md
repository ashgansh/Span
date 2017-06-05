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
`git clone https://github.com/benjaminshafii/asset-manager.git`


#### Create a docker network
`docker network create span`

#### Generate the db
```
# Launch postgres in the background
docker-compose up -d postgres
docker-compose run web mix ecto.create
```
#### Apply all the migrations
`docker-compose run web mix ecto.migrate`

#### Generate some seed data (Optional)

Check the file to see what data is generated. Change it as you will!

`docker-compose run web mix priv/repo/seeds.exs`


### To Launch the containers

`docker-compose up`

### Using it

Go to `http://localhost:4000/graphiql`

Use the following to get a token
```
mutation Login {
  login(email: "ben@ben.com", password:"password")
}
```


## Useful Commands
Running your project 

The following command is similar to using the Rails `console` or the Django `shell`
`docker-compose run web ie -S mix`

## License
MIT
