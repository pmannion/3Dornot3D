# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#...

Product.destroy_all

Product.create(:title =>'Anna Karenina',
               :description =>
                   %{<p>Action blockbuster..</p>},
               :genre =>'Drama',
               :rating => '4.9',
               :stock_status =>'new',
               :price => 17.99,
               :wanted => 'no' ,
               :buy_price => 7.00 ,
               :image_url =>'anna karenina.jpg')

Product.create(:title =>'Argo',
               :description =>
                   %{<p>An action blockbuster thriller, with an all star cast.</p>},
               :genre =>'Thriller',
               :rating => '3.2',
               :stock_status => 'new',
               :price => 16.99,
               :wanted => 'yes',
               :buy_price => 8.00,
               :image_url =>'argo.jpg')

Product.create(:title =>'Avengers Assemble',
               :description =>
                   %{<p>An sci-fi blockbuster, with an all star cast</p>},
               :genre =>'sci-fi',
               :rating => '4.1',
               :stock_status =>'new',
               :price => 19.99,
               :wanted => 'yes',
               :buy_price => 7.00,
               :image_url =>'avengers.jpg')

Product.create(:title =>'The Dark Knight',
               :description =>
                   %{<p>The final installment of the batman movies, batman battles Bane. </p>},
               :genre =>'Action',
               :rating => '4.9',
               :stock_status =>'new',
               :price => 18.99,
               :wanted => 'yes',
               :buy_price => 8.00,
               :image_url =>'dark knight.jpg')

Product.create(:title =>'The Bourne Legacy',
               :description =>
                   %{<p>An action blockbuster thriller, with an all star cast</p>},
               :genre =>'Thriller',
               :rating => '5.2',
               :stock_status =>'new',
               :price => 17.99,
               :wanted => 'yes',
               :buy_price => 7.00,
               :image_url =>'bourne.jpg')

Product.create(:title =>'Brave',
               :description =>
                   %{<p>A animation blockbuster from pixar</p>},
               :genre =>'Animation',
               :rating => '4.3',
               :stock_status =>'new',
               :price => 16.99,
               :wanted => 'no' ,
               :buy_price => 7.00 ,
               :image_url =>'brave.jpg')

Product.create(:title =>'Diary of a wimpy kid',
               :description =>
                   %{<p>Family fun comedy</p>},
               :genre =>'Comedy',
               :rating => '3.1',
               :stock_status =>'new',
               :price => 19.99,
               :wanted => 'no' ,
               :buy_price => 7.00 ,
               :image_url =>'diary wimpy kid dog days.jpg')

Product.create(:title =>'Flight',
               :description =>
                   %{<p>Denzel Washington stars in this fantastic drama</p>},
               :genre =>'Drama',
               :rating => '4.5',
               :stock_status =>'new',
               :price => 18.99,
               :wanted => 'yes',
               :buy_price => 8.00,
               :image_url =>'flight.jpg')

Product.create(:title =>'Fun Size',
               :description =>
                   %{<p>Teen comedy.</p>},
               :genre =>'comedy',
               :rating => '2.3',
               :stock_status =>'new',
               :price => 17.99,
               :wanted => 'no' ,
               :buy_price => 7.00 ,
               :image_url =>'fun size.jpg')

Product.create(:title =>'Here come the boom',
               :description =>
                   %{<p>Comedy with an all star cast</p>},
               :genre =>'Comedy',
               :rating => '3.6',
               :stock_status =>'new',
               :price => 19.99,
               :wanted => 'no' ,
               :buy_price => 7.00 ,
               :image_url =>'here comes the boom.jpg')




Product.create(:title => 'Hope Springs',
               :description =>
                   %{<p>Helen Mirren stars in drama movie</p>},
               :genre =>'Drama',
               :rating => '3.8',
               :stock_status =>'new',
               :price => 16.99,
               :wanted => 'no' ,
               :buy_price => 7.00 ,
               :image_url =>'hope springs.jpg')

Product.create(:title =>'Hotel Transylvania',
               :description =>
                   %{<p>Animation fun for the whole family</p>},
               :genre =>'Animation',
               :rating => '4.1',
               :stock_status =>'new',
               :price => 15.99,
               :wanted => 'no' ,
               :buy_price => 7.00 ,
               :image_url =>'hotel transylvania.jpg')

Product.create(:title =>'Ice Age 3',
               :description =>
                   %{<p>Animation from dreamworks, the third installment</p>},
               :genre =>'Animation',
               :rating => '4.8',
               :stock_status =>'new',
               :price => 18.99,
               :wanted => 'yes',
               :buy_price => 7.00,
               :image_url =>'ice age.jpg')

Product.create(:title =>'Judge Dredd',
               :description =>
                   %{<p>Comic book revamp with an all star cast</p>},
               :genre =>'Sci-fi',
               :rating => '3.3',
               :stock_status =>'new',
               :price => 17.99,
               :wanted => 'yes',
               :buy_price => 8.00,
               :image_url =>'judge dredd.jpg')

Product.create(:title =>'Lawless',
               :description =>
                   %{<p>All star action thriller</p>},
               :genre =>'Thriller',
               :rating => '4.2',
               :stock_status =>'new',
               :price => 18.99,
               :wanted => 'yes',
               :buy_price => 7.00,
               :image_url =>'lawless.jpg')

Product.create(:title =>'Lincoln',
               :description =>
                   %{<p><Factual based movie on the former us president/p>},
               :genre =>'Drama',
               :rating => '2.9',
               :stock_status =>'new',
               :price => 18.99,
               :wanted => 'no' ,
               :buy_price => 7.00 ,
               :image_url =>'lincoln.jpg')

Product.create(:title =>'Looper',
               :description =>
                   %{<p>All star cast with Bruce Willis and Joseph Gordon Levitt</p>},
               :genre =>'Sci-fi',
               :rating => '4.4',
               :stock_status =>'new',
               :price => 16.99,
               :wanted => 'yes',
               :buy_price => 8.00,
               :image_url =>'looper.jpg')

Product.create(:title =>'Madagascar 3',
               :description =>
                   %{<p>Animation family fun</p>},
               :genre =>'Animation',
               :rating => '3.5',
               :stock_status =>'new',
               :price => 19.99,
               :wanted => 'yes',
               :buy_price => 7.00,
               :image_url =>'madagascar 3.jpg')

Product.create(:title =>'Men in Black 3',
               :description =>
                   %{<p>Men in black return for a third time</p>},
               :genre =>'Sci-fi',
               :rating => '3.4',
               :stock_status =>'new',
               :price => 17.99,
               :wanted => 'no' ,
               :buy_price => 7.00 ,
               :image_url =>'men inblack 3.jpg')

Product.create(:title =>'Paranormal Activity',
               :description =>
                   %{<p>Spooky horror sequel, jumps and screams for 90mins.</p>},
               :genre =>'Horror',
               :rating => '1.7',
               :stock_status =>'new',
               :price => 17.99,
               :wanted => 'no' ,
               :buy_price => 7.00 ,
               :image_url =>'paranormal activity 4.jpg')

Product.create(:title =>'Promethues',
               :description =>
                   %{<p>Blockbuster sci-fi set as a prequel to Alien</p>},
               :genre =>'Sci-fi',
               :rating => '5.0',
               :stock_status =>'used',
               :price => 19.99,
               :wanted => 'yes',
               :buy_price => 6.00,
               :image_url =>'prometheus.jpg')

Product.create(:title =>'Red Lights',
               :description =>
                   %{<p>supernatural thriller staring Robert De Niro</p>},
               :genre =>'Thriller',
               :rating => '3.0',
               :stock_status =>'used',
               :price => 10.00,
               :wanted => 'no' ,
               :buy_price => 7.00 ,
               :image_url =>'red lights.jpg')

Product.create(:title =>'Rise of The Guardians',
               :description =>
                   %{<p>animation fun for all of the family</p>},
               :genre =>'Animation',
               :rating => '2.5',
               :stock_status =>'used',
               :price => 11.00,
               :wanted => 'no' ,
               :buy_price => 7.00 ,
               :image_url =>'rise of guardians.jpg')

Product.create(:title =>'Rock of Ages',
               :description =>
                   %{<p>Goofy comedy staring Alec Baldwin</p>},
               :genre =>'Comedy',
               :rating => '1.9',
               :stock_status =>'used',
               :price => 10.00,
               :wanted => 'no' ,
               :buy_price => 7.00 ,
               :image_url =>'Rock of ages.jpg')

Product.create(:title =>'Silent Hill',
               :description =>
                   %{<p>Chilling horror to keep you awake at night</p>},
               :genre =>'Horror',
               :rating => '1.7',
               :stock_status =>'used',
               :price => 12.00,
               :wanted => 'no' ,
               :buy_price => 7.00 ,
               :image_url => 'silent hill.jpg')

Product.create(:title =>'Sinister',
               :description =>
                   %{<p>Gory horror, a murderer is loose and on the kill</p>},
               :genre =>'Horror',
               :rating => '3.3',
               :stock_status =>'used',
               :price => 12.00,
               :wanted => 'no' ,
               :buy_price => 7.00 ,
               :image_url =>'sinister.jpg')

Product.create(:title =>'Skyfall',
               :description =>
                   %{<p>Latest installment of the bond franchise, tense action beginning to end</p>},
               :genre =>'Action',
               :rating => '5.9',
               :stock_status =>'used',
               :price => 13.00,
               :wanted => 'yes',
               :buy_price => 6.00,
               :image_url =>'skyfall.jpg')

Product.create(:title =>'Spiderman',
               :description =>
                   %{<p>Remake of the spiderman movies Peter parker becomes spiderman</p>},
               :genre =>'Sci-fi',
               :rating => '4.1',
               :stock_status =>'used',
               :price => 12.00,
               :wanted => 'yes',
               :buy_price => 6.00,
               :image_url =>'spiderman.jpg')

Product.create(:title =>'Taken 2',
               :description =>
                   %{<p>Sequel to blockbuster action hit from Liam Neeson</p>},
               :genre =>'Thriller',
               :rating => '4.2',
               :stock_status =>'used',
               :price => 12.00,
               :wanted => 'yes',
               :buy_price => 6.00,
               :image_url =>'Taken 2.jpg')

Product.create(:title =>'Ted',
               :description =>
                   %{<p>Comedy from the creator of family guy</p>},
               :genre =>'Comedy',
               :rating => '4.0',
               :stock_status =>'used',
               :price => 13.00,
               :wanted => 'yes',
               :buy_price => 7.00,
               :image_url =>'Ted.jpg')

Product.create(:title =>'The Campaign',
               :description =>
                   %{<p>Slapstick comedy starring Will Farrell, on the campaign to become governor.</p>},
               :genre =>'Comedy',
               :rating => '2.7',
               :stock_status =>'used',
               :price => 10.00,
               :wanted => 'no' ,
               :buy_price => 7.00 ,
               :image_url =>'The campaign.jpg')

Product.create(:title =>'The Expendables 2',
               :description =>
                   %{<p>Action sequel with an all star cast</p>},
               :genre =>'Action',
               :rating => '3.9',
               :stock_status =>'used',
               :price => 12.00,
               :wanted => 'no' ,
               :buy_price => 7.00 ,
               :image_url =>'The expendables 2.jpg')

Product.create(:title =>'The Hunger Games',
               :description =>
                   %{<p>Action blockbuster.</p>},
               :genre =>'Thriller',
               :rating => '5.1',
               :stock_status =>'used',
               :price => 11.00,
               :wanted => 'no' ,
               :buy_price => 7.00 ,
               :image_url =>'the hunger games.jpg')

Product.create(:title =>'The Lorax',
               :description =>
                   %{<p>Animation from Dr. zeus fun for the whole family</p>},
               :genre =>'Animation',
               :rating => '5.2',
               :stock_status =>'used',
               :price => 12.00,
               :wanted => 'yes',
               :buy_price => 6.00,
               :image_url =>'The lorax.jpg')

Product.create(:title =>'The Three Stooges',
               :description =>
                   %{<p>Slapstick comedy following the three stooges on a wacky adventure</p>},
               :genre =>'Comedy',
               :rating => '5.3',
               :stock_status =>'used',
               :price => 11.00,
               :wanted => 'no' ,
               :buy_price => 7.00 ,
               :image_url =>'The three stooges.jpg')

Product.create(:title =>'The Watch',
               :description =>
                   %{<p>All star comedy with Ben stiller and Vince Vaughan</p>},
               :genre =>'Comedy',
               :rating => '5.4',
               :stock_status =>'used',
               :price => 12.00,
               :wanted => 'yes',
               :buy_price => 7.00,
               :image_url => 'the watch.jpg')

Product.create(:title =>'Total Recall',
               :description =>
                   %{<p>Remake of the Arnold 80's movie starring Colin Farrell</p>},
               :genre =>'Sci-fi',
               :rating => '5.5',
               :stock_status =>'used',
               :price => 11.00,
               :wanted => 'yes',
               :buy_price => 6.00,
               :image_url =>'Total recall.jpg')

Product.create(:title =>'Twilight',
               :description =>
                   %{<p>Last in the franchise of twilight who will win vampires or werewolves</p>},
               :genre =>'Action',
               :rating => '5.6',
               :stock_status =>'used',
               :price => 12.00,
               :wanted => 'yes',
               :buy_price => 7.00,
               :image_url =>'twilight.jpg')

Product.create(:title =>'What Richard Did',
               :description =>
                   %{<p>Compelling Irish drama</p>},
               :genre =>'Drama',
               :rating => '5.8',
               :stock_status =>'used',
               :price => 13.00,
               :wanted => 'yes',
               :buy_price => 8.00,
               :image_url =>'what richard did.jpg')




