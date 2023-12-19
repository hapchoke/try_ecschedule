import multiprocessing

bind = ['0.0.0.0:8000']
workers = multiprocessing.cpu_count() * 2 + 1
timeout = 1800
reload = True
logLevel = 'warning'
limit_request_line = 8192