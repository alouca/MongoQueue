# MongoQueue

MongoQueue is Job queue written in Go, which uses Mongo as a backend storage engine. It supports a sophisticated feature set,  facilitating fine-grained job queueing.

It supports job locking, retries for failed jobs, retry timers, age limits and failure limits.

## Example usage

To create a new MongoQueue:

`mq := NewMongoQueue("mq", "testing", "127.0.0.1", &&MongoQueueSettings{LockLimit: 5, RetryLimit: 2, MinBackoff: 1, MaxBackoff: 3, MaxDoublings: 2, AgeLimit: 25})`

mq is the database, testing is the collection and 127.0.0.1 is the mongo server. The MongoQueueSettings is a struct, which contains all the necessary queue behaviour parameters. All of the time parameters are specified in seconds.

Parameter description:

* **LockLimit**: The maximum number of seconds a job can remain locked to a pid
* **RetryLimit**: The maximum number of retry attempts for a failed task
* **MinBackoff**: The minimum number of seconds to wait before retrying a task after it fails.
* **MaxBackoff**: The minimum number of seconds to wait before retrying a task after it fails.
* **MaxDoublings**: The maximum number of times that the interval between failed task retries will be doubled before the increase becomes constant. The constant is: 2**(max_doublings - 1) * min_backoff_seconds.
* **AgeLimit**: The time limit for retrying a failed task, in seconds, measured from the time the task was created.