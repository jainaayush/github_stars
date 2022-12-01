# README

## Environment

* Ruby 2.7.2
* Ruby on Rails 7.0.4
* MongoDB 4.2.23
* Redis 5.0.7
* YARN

### Starting project

Run redis server
```
/etc/init.d/redis-server start
```
Run mongodb server
```
sudo systemctl start mongod
```

### Api endpoint

```
localhost:3000/repositories
```
Pass username in form-data.