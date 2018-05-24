package rocks.npa.web.stat

import org.apache.log4j.{Level, Logger}
import org.apache.spark.sql.SparkSession

object Main  extends App {

  Logger.getLogger("org").setLevel(Level.ERROR)
  Logger.getLogger("akka").setLevel(Level.ERROR)

  val spark = SparkSession.builder.appName("user-stat").master("local[*]").getOrCreate()

  spark.sql("select 1").show

}
