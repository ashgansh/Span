# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     App.Repo.insert!(%App.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
#
# 
alias App.User
alias App.Asset
alias App.Location
alias App.Repo
 
Faker.start
%User{name: "Benjamin", email: "ben@ben.com"}
|> User.registration_changeset(%{password: "password"})
|> Repo.insert()

for _ <- 1..10 do
  Repo.insert!(%Location{
    name: Faker.Commerce.En.department,
    latitude: 49.6116,
    longitude: 6.1319,
    user_id: 1,
  })
end


for _ <- 1..1000 do
  Repo.insert!(%Asset{
    name: Faker.Name.first_name,
    lifespan: 100,
    location_id: 1,
    user_id: 1,
  })
end
