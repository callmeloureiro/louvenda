# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

  User.create(:email => "web@matheusloureiro.com.br", :password => "loureiro", :password_confirmation => "loureiro", :cpf => "000.000.000-00", :level => 1, :name => "Matheus Loureiro")
