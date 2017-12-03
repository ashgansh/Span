docker-compose up -d postgres
docker-compose up -d backend

docker-compose run backend mix deps.get 
docker-compose run backend mix ecto.create
docker-compose run backend mix ecto.migrate
docker-compose run backend mix run priv/repo/seeds.exs
