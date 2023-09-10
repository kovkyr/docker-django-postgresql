# docker-django-postgresql

Docker with Django 4.2.5 and PostgreSQL 12

### Installation

* Update Django secret key in `.env` file:
```
SECRET_KEY=secret_key
```

* Update database password in `.env` file:
```
DB_PASSWORD=123456
```

* Create and run app:
```
make docker-create
```

* Get help:
```
make help
```

Go to http://localhost:3000/
