    # This file should contain all the record creation needed to seed the database with its default values.
    # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
    #
    # Examples:
    #
    #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
    #   Character.create(name: 'Luke', movie: movies.first)

    #os filmes e reviews a seguir serao apagados posteriormente
    f1 = Movie.create(name: 'Star Wars', release_date: '09/01/2000 00:00:00', genres: 'ação, drama', description: '"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', director:"Jorge Lucas", trailer: '<iframe width="560" height="315" src="https://www.youtube.com/embed/W0squnw6Jp8" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>')
    f2 = Movie.create(name: 'Star Trek', release_date: '09/01/2000 00:00:00', genres: 'ação, drama', description: '"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', director:"Jorge Lucas")

    u1 = User.create(email: 'teste@gmail.com', info: 'Otaku', password: 'abcd', is_admin: 1, user_name: 'admin')
    
    r1 = Review.create(comment: "Muito bom, bacana", user: u1, movie: f1, score: 5)
    r2 = Review.create(comment: "muito ruim", user: u1, movie: f2, score: 1)