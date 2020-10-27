# This is a simple R script to test rredis library
library(rredis)

# We will need a redis instance running
system("docker run --name some-redis -p 6379:6379 -d redis")

# Running on local
redisConnect(host = 'localhost')

# Check is key exists
redisExists('foo')
# Assign a value
redisSet('foo', 10)
# Retrieve
redisGet('foo')
# Update value to something different
redisSet('foo', runif(10))
# Delete value
redisDelete('foo')

# Assign using a value map or list
redisMSet(list(x=pi,y='Cazart',z=runif(2)))
# Retrieve a set of keys
redisMGet(list('z','y'))

# Scan
l <- redisKeys()
redisMGet(l)

# Flush all data
redisFlushAll()

# Close
redisClose()
