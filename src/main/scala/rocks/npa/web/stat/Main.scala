package rocks.npa.web.stat

import org.apache.log4j.{Level, Logger}
import org.apache.spark.sql.SparkSession

object Main extends App {

  Logger.getLogger("org").setLevel(Level.ERROR)
  Logger.getLogger("akka").setLevel(Level.ERROR)

  val spark = SparkSession.builder
    .appName("user-stat")
    .master("local[*]")
    .getOrCreate()

  import spark.implicits._

  // read Kafka input
  val readDF1 = spark
    .readStream
    .format("kafka")
    .option("kafka.bootstrap.servers", "localhost:9092")
    .option("subscribe", "user-visit")
    //.option("startingOffsets", "earliest")
    .load()

  // parse
  val parseDF1 = readDF1.selectExpr("CAST(key AS STRING)", "CAST(value AS STRING)")
    .as[(String, String)]

  // console print
  val query1 = parseDF1.writeStream
    .queryName("Input: Kafka topic 'user-visit'")
    .format("console")
    .option("truncate", value = false)
    .start()

  // transform
  val transformDF1 = parseDF1

  // write Kafka output
  val writeDF1 = parseDF1
    .selectExpr("CAST(key AS STRING)", "CAST(value AS STRING)")
    .writeStream
    .format("kafka")
    .option("kafka.bootstrap.servers", "localhost:9092")
    .option("topic", "user-stat")
    .option("checkpointLocation", "spark-warehouse/streamed")
    .start()


  query1.awaitTermination()


  // todo: create transformation function from in to out
  // todo: api rest in, api rest out: https://github.com/confluentinc/kafka-rest

}
