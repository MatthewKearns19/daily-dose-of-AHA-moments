# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Users = User.create([
  { id: '1',
    first_name: 'John',
    last_name: 'Doe',
    username: 'JohnDoeIsTheBest',
    email: 'JohnDoeIsTheBest@gmail.com',
    password: 'mypassword'
  },
  { id: '2',
    first_name: 'Alex',
    last_name: 'Brute',
    username: 'AlexsUsernameBest',
    email: 'Alex@gmail.com',
    password: 'testpassword' }])

Commutities = Community.create([
  { name: 'Movie Enthusiasts',
    url: 'MovieEnthusiasts',
    description: 'This community is about Film, any Movie genre and any
    language, we want to hear about it all!',
    user_id: '1'
  },
  { name: 'Adventure',
    url: 'AdventureCommunity',
    description: 'This community is about all things outdoors related, sharing
     jobs, travel, nature, and earthy adventures',
    user_id: '1'
  },
  { name: 'Programming',
    url: 'ProgrammingCommunity',
    description: 'Lets explore programming together. Post all programming
    related content. News, jobs, personal projects, ideas, and events. Please
    keep it ethical (and no Memes!)',
    user_id: '1'
  },
  { name: 'Wildlife101',
    url: 'Wildlife101Community',
    description: 'Have you ever been to a Safari? How about a Rainforrest? Well
     I havent :P so please share any cool Wildlife related content. This will be
     an area to see other peoples views/photos/videos/personal stories/wildlife
     exploration training ect. ect. ect. Have fun!',
    user_id: '1'
  },
  { name: 'Real Estate',
    url: 'RealEstateCommunity',
    description: 'This is a community for sharing Real Estate related
    views/topics/courses/jobs. Have fun, make friends, and keep it ethical!',
    user_id: '2'
  },
  { name: 'Space',
    url: 'SpaceCommunity',
    description: 'This community is about Space...Yes, that big unknown that we
     know is always there but not enough people think about it, or
     if they did soon enough they would find they would not be able to
     funtion in society due to a racing mind of infinate questions and feelings
     of insignificance on this floating, tiny ball of dust made from dead stars
     over billion of years. So lets talk Space Exploration, Space travel, Aliens
     if you will...and just remember to keep it ethical! ',
    user_id: '2' }])

Posts = Post.create([
  { title: 'The right people with teh right code',
    body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean
    blandit turpis vitae consequat condimentum. Phasellus erat sem, vulputate at
     arcu quis, pellentesque fermentum turpis. In dapibus arcu dolor, vitae
     commodo nisi feugiat eget. Maecenas enim magna, aliquet in interdum vitae,
     blandit a sapien. In porta finibus arcu eu rutrum. Aenean euismod quis
     felis ac tempor. Proin pellentesque diam dolor. Pellentesque habitant morbi
      tristique senectus et netus et malesuada fames ac turpis egestas. Sed
      finibus, nibh sed suscipit condimentum, sapien eros ullamcorper diam, nec
      tincidunt mauris ante nec tellus. Sed mattis, purus sed scelerisque
      semper, arcu ante rhoncus velit, eu molestie tellus urna eu eros. Quisque
      fermentum lectus eu nibh placerat, non lobortis velit sagittis. Aliquam ut
       mauris dui. Vestibulum ac augue vitae eros dictum tempor. Vestibulum eu
       pharetra arcu.',
    user_id: '1',
    community_id: '2',
  },
  { title: 'Ruby on Rails architecture',
    body: 'Ruby Ruby Ruby Rubayyy',
    user_id: '1',
    community_id: '2' }])
