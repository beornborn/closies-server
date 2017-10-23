### Closies

*Social network for close friends and family. Just for fun.*

[api.closies.co](http://api.closies.co/api/v1/dev/check)

**landing**: [closies.co](http://www.closies.co) ------------- [beornborn/closies-web](https://github.com/beornborn/closies-web)

**android app**: [beornborn/closies-app](https://github.com/beornborn/closies-app)



#### Setup

add export `DISABLE_DATABASE_ENVIRONMENT_CHECK=1` to `~/.bashrc`

#### Deploy

`git push heroku`

#### Helpful commands

restore db from heroku: `rake db:from_heroku`
