docker service create \
    --network formatik_net \
    --replicas 1 \
    --constraint 'node.labels.db == true' \
    --mount type=volume,source=FormatikMongo,destination=/data/db,volume-label="mongo=01" \
    -p 27017:27017 \
    --name mongo01 \
    --hostname mongo01 \
    mongo:3.4.4 \
    --auth

docker run --rm -it --add-host=mongo01:10.134.22.243 mongo:3.4.4 mongo mongodb://mongo01:27017/admin

>db.createUser({ user: 'admin', pwd: 'kR8h%a4a', roles: [ 
        {
            "role" : "userAdminAnyDatabase",
            "db" : "admin"
        }, 
        {
            "role" : "dbAdminAnyDatabase",
            "db" : "admin"
        }, 
        {
            "role" : "readWriteAnyDatabase",
            "db" : "admin"
        }
] });

db.createUser({ user: 'api', pwd: 'j*d4G3so', roles: [ 
        {
            "role" : "readWrite",
            "db" : "Formatik"
        }, 
        {
            "role" : "dbAdmin",
            "db" : "Formatik"
        }
] });

db.createUser({ user: 'api', pwd: 'j*d4G3so', roles: [ 
        {
            "role" : "readWrite",
            "db" : "Logs"
        }, 
        {
            "role" : "dbAdmin",
            "db" : "Logs"
        }
] });