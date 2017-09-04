namespace :db do
  task :from_heroku do
    `heroku pg:backups:capture --app closies-api`
    `heroku pg:backups:download --app closies-api`
    `pg_restore --verbose --clean --no-acl --no-owner -h localhost -d closies_development latest.dump`
    `rm latest.dump`
  end
end
