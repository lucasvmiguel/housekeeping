
sudo docker-compose run web rake db:migrate RAILS_ENV="production"
sudo docker-compose build
sudo docker-compose up