docker-compose up -d postgres

docker-compose run web mix deps.get 
docker-compose run web mix ecto.create
docker-compose run web mix ecto.migrate
docker-compose run web mix run priv/repo/seeds.exs
