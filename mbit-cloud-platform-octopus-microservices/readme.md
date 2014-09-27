# mbit Octopus REST micro-services

- Three Spring Boot based Maven projects that are standalone applications:
  - Stores (MongoDB)
  - Customers (JPA)
  - Suppiers (JPA)
  - Catalog (JPA)
  - BookStore (JPA  )
  - Usergrid (Cassandra)
  - Doge (MongoDB)

- The customers application tries to discover a search-by-location-resource and periodically verifying it's still available (see `StoreIntegration`).
- If the remote system is found the customers app includes a link to let clients follow to the remote system and thus find stores near the customer and same applies to all others.
- Hystrix is used to monitor the availability of the remote system, so if it fails to connect 20 times in 5 seconds (by default) the circuit will open and no more attempts will be made until after a timeout.
