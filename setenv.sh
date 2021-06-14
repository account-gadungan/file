JAVA_OPTS="-Xms256m -Xmx512m -XX:MaxMetaspaceSize=128m"; # memorysettings

CATALINA_OPTS="-server -Dsun.io.useCanonCaches=false -Djava.library.path=/usr/local/apr/lib -Xms1024m -Xmx12288m 
-XX:MaxMetaspaceSize=1024M -XX:NewSize=340M -XX:MaxNewSize=340M
-XX:+UseConcMarkSweepGC -XX:+CMSParallelRemarkEnabled -XX:+UseCMSInitiatingOccupancyOnly
-XX:CMSInitiatingOccupancyFraction=70 -XX:GCTimeRatio=5
-XX:ThreadPriorityPolicy=42 -XX:MaxGCPauseMillis=50
-XX:+DisableExplicitGC -XX:MaxHeapFreeRatio=70 -XX:MinHeapFreeRatio=40
-XX:+UseStringCache -XX:+OptimizeStringConcat -XX:+UseTLAB
-XX:+ScavengeBeforeFullGC -XX:+CMSScavengeBeforeRemark
-XX:CompileThreshold=1500 -XX:+TieredCompilation -XX:+UseBiasedLocking
-Xverify:none -XX:+UseThreadPriorities -XX:+UseLargePages
-XX:LargePageSizeInBytes=2m -XX:+UseFastAccessorMethods -XX:+UseCompressedOops";

# additional JVM arguments can be added to the above line as needed,such as
# custom Garbage Collection arguments.
export CATALINA_OPTS;
export JAVA_OPTS;
