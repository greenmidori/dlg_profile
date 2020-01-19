echo "docker pull ruby:2.5.3"
docker pull ruby:2.5.3

echo "docker pull mysql:5.7"
docker pull mysql:5.7

echo "docker image build"
docker-compose build

echo "docker-compose run web rake db:create"
docker-compose run web rails db:create

echo "docker-compose up"
docker-compose up

