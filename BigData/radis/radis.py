import redis

r = redis.Redis(
    host='127.0.0.1',
    port=6379,
    password='')

r.set('pruduct1:name','stylo')
value = r.get('pruduct1:name')
print(value.decode("utf-8") )