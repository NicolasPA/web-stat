name := "web-stat"

version := "0.1"

scalaVersion := "2.11.8"

updateOptions := updateOptions.value.withCachedResolution(true)

val sparkVersion = "2.3.0"

libraryDependencies ++= Seq(
  "org.apache.spark" %% "spark-core" % sparkVersion % Provided,
  "org.apache.spark" %% "spark-sql" % sparkVersion % Provided,
  "org.apache.spark" %% "spark-sql-kafka-0-10" % sparkVersion
)