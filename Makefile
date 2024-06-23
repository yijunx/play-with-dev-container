up:
	@echo "starting"
	@gunicorn 'app.main:app'  -w 1 -b 0.0.0.0:8000  # --worker-class gevent