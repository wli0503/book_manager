#!/bin/sh

#Doing some clean up
rake db:reset

#These populators need to be run at first!
rake db:populate_authors
rake db:populate_readers
rake db:populate_genres
rake db:populate_publishers
rake db:populate_orders

#These don't
rake db:populate_subgenres
rake db:populate_books
rake db:populate_order_details
rake db:populate_reviews
