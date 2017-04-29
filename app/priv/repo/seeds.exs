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
alias App.Repo
 
Faker.start
# Repo.insert!(%User{name: "Benjamin", email: "benjamin@me.com"})
 
for _ <- 1..100 do
  Repo.insert!(%Asset{
    name: Faker.Name.first_name,
    location: Faker.Address.country,
  })
end
