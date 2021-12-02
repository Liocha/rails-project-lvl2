i:
	bundle

t:
	bundle exec rake

l:
	bundle exec rubocop .

la:
	bundle exec rubocop -A .

s:
	rails server

cs:
	bin/rails console --sandbox

rs:
	bin/setup