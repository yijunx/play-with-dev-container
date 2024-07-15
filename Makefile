up:
	@echo "starting"
	@gunicorn 'app.main:app'  -w 1 -b 0.0.0.0:8000  # --worker-class gevent

test:
	# @alembic upgrade head
	@clear
	@pytest  --durations=0 -v --cov=app

format:
	@isort app/
	@isort tests/
	@black app/
	@black tests/
