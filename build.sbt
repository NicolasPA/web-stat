name := "web-stat"

version := "0.1"

scalaVersion := "2.11.8"

// Use cached dependencies to avoid re-downloading every time
updateOptions := updateOptions.value.withCachedResolution(true)

// In case of using `sbt assembly` to bring dependencies in a fat jar:
// Exclude Scala
assemblyOption in assembly := (assemblyOption in assembly).value.copy(includeScala = false)
// Merge strategy
assemblyMergeStrategy in assembly := {
  case PathList("META-INF", xs @ _*) => MergeStrategy.discard
  case x => MergeStrategy.first
}

val sparkVersion = "2.3.0"

libraryDependencies ++= Seq(
  "org.apache.spark" %% "spark-core" % sparkVersion % Provided,  // excluded from fat jar
  "org.apache.spark" %% "spark-sql" % sparkVersion % Provided,   // excluded from fat jar
  "org.apache.spark" %% "spark-sql-kafka-0-10" % sparkVersion    // included in fat jar
)