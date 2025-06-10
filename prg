- name: Install htop on localhost
  hosts: local
  become: true
  tasks:
    - name: Install htop
      ansible.builtin.package:
        name: htop
        state: present
77777
---
- name: Deploy JAR from Jenkins
  hosts: localhost
  become: true
  tasks:
    - name: Copy JAR from Jenkins workspace
      copy:
        src: /mnt/c/ProgramData/Jenkins/.jenkins/workspace/8thproject/target/myapp-1.0-SNAPSHOT.jar
        dest: /mnt/d/external/mavenfor8th/myapp/myapp-1.0-SNAPSHOT.jar
        mode: '0755'

    - name: Run Java App in Background
      shell: nohup java -jar /mnt/d/external/mavenfor8th/myapp/myapp-1.0-SNAPSHOT.jar > app.log 2>&1 &
888888888
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
  <modelVersion>4.0.0</modelVersion>

  <groupId>com.example</groupId>
  <artifactId>myapp</artifactId>
  <version>1.0-SNAPSHOT</version>

  <dependencies>
    <!-- JUnit Dependency for Testing -->
    <dependency>
      <groupId>junit</groupId>
      <artifactId>junit</artifactId>
      <version>4.13.2</version>
      <scope>test</scope>
    </dependency>
  </dependencies>

  <build>
    <plugins>
      <!-- Maven Surefire Plugin for running tests -->
      <plugin>
        <groupId>org.apache.maven.plugins</groupId>
        <artifactId>maven-surefire-plugin</artifactId>
        <version>2.22.2</version>
        <configuration>
          <redirectTestOutputToFile>false</redirectTestOutputToFile>
          <useSystemOut>true</useSystemOut>
        </configuration>
      </plugin>
      <plugin>
        <groupId>org.apache.maven.plugins</groupId>
        <artifactId>maven-jar-plugin</artifactId>
        <version>3.3.0</version>
        <configuration>
          <archive>
            <manifest>
              <mainClass>com.example.App</mainClass>
            </manifest>
          </archive>
        </configuration>
      </plugin>
    </plugins>
  </build>
</project>
POM.XML88888888



package com.example;

public class App {

    public int add(int a, int b) {
        return a + b;
    }

    public static void main(String[] args) {
        App app = new App();

        int result = app.add(2, 3);
        System.out.println("2 + 3 = " + result);

        System.out.println("Application executed successfully!");
    }
}
APP.JAVA 22


package com.example;

import org.junit.Assert;
import org.junit.Test;

public class AppTest {

    @Test
    public void testAdd() {
        App app = new App();
        int result = app.add(2, 3);

        System.out.println("Running test: 2 + 3 = " + result);

        Assert.assertEquals(5, result);
    }
}
TEST.JAVA 22
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>

    <groupId>com.example</groupId>
    <artifactId>myapp</artifactId>
    <version>1.0-SNAPSHOT</version>

    <dependencies>
        <!-- JUnit Dependency for Testing -->
        <dependency>
            <groupId>junit</groupId>
            <artifactId>junit</artifactId>
            <version>4.13.2</version>
            <scope>test</scope>
        </dependency>
    </dependencies>

    <build>
        <plugins>
            <!-- Maven Surefire Plugin for running tests -->
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-surefire-plugin</artifactId>
                <version>2.22.2</version>
                <configuration>
                    <redirectTestOutputToFile>false</redirectTestOutputToFile>
                    <useSystemOut>true</useSystemOut>
                </configuration>
            </plugin>
        </plugins>
    </build>
</project>
POM.XML 222





gradle init --type java-application


grovy

plugins {
    id 'application'
}

application {
    mainClass = 'com.example.AdditionOperation'
}

repositories {
    mavenCentral()
}

dependencies {
    testImplementation 'junit:junit:4.13.2'
}

test {
    outputs.upToDateWhen { false }

    testLogging {
        events "passed", "failed", "skipped"
        exceptionFormat "full"
        showStandardStreams = true
    }
}



Step 3: AdditionOperation.java(Change file name and update below code)

After creating project change the file name.
Manually navigate the folder path like src/main/java/org/example/
Change the file name App.java to AdditionOperation.java
After then open that file and copy the below code and past it, save it.

package com.example;

public class AdditionOperation {
    public static void main(String[] args) {
        double num1 = 5;
        double num2 = 10;

        double sum = num1 + num2;

        System.out.printf("The sum of %.2f and %.2f is %.2f%n", num1, num2, sum);
    }
}



: AdditionOperationTest.java (JUnit Test) (Change file name and update below code)

After creating project change the file name.
Manually navigate the folder path like src/test/java/org/example/
Change the file name AppTest.java to AdditionOperationTest.java
After then open that file and copy the below code and past it, save it.

package com.example;

import org.junit.Test;
import static org.junit.Assert.*;

public class AdditionOperationTest {

    @Test
    public void testAddition() {
        double num1 = 5;
        double num2 = 10;
        double expectedSum = num1 + num2;

        double actualSum = num1 + num2;

        assertEquals(expectedSum, actualSum, 0.01);
    }
}


gradle build😊

gradle run
gradle test




kotlin


gradle init --type java-application😊

plugins {
    kotlin("jvm") version "1.8.21"
    application 
}

repositories {
    mavenCentral()
}

dependencies {
    implementation(kotlin("stdlib"))
    testImplementation("junit:junit:4.13.2")
}

application {
    mainClass.set("com.example.MainKt")
}

tasks.test {
    useJUnit() 

    testLogging {
        events("passed", "failed", "skipped") 
        exceptionFormat = org.gradle.api.tasks.testing.logging.TestExceptionFormat.FULL 
        showStandardStreams = true 
    }

    outputs.upToDateWhen { false }
}

java {
    toolchain {
        languageVersion.set(JavaLanguageVersion.of(17))
    }
}

Step 3: Main.kt (Change file name and update below code)

After creating project change the file name.
Manually navigate the folder path like src/main/java/org/example/
Change the file name App.java to Main.kt
After then open that file and copy the below code and past it, save it.





package com.example

fun addNumbers(num1: Double, num2: Double): Double {
    return num1 + num2
}

fun main() {
    val num1 = 10.0
    val num2 = 5.0
    val result = addNumbers(num1, num2)
    println("The sum of $num1 and $num2 is: $result")
}


Step 4: MainTest.kt (JUnit Test) (Change file name and update below code)

After creating project change the file name.
Manually navigate the folder path like src/test/java/org/com/example/
Change the file name MainTest.java to MainTest.kt
After then open that file and copy the below code and past it, save it.



package com.example

import org.junit.Assert.*
import org.junit.Test

class MainTest {

    @Test
    fun testAddNumbers() {
        val num1 = 10.0
        val num2 = 5.0
        
        val result = addNumbers(num1, num2)

        assertEquals("The sum of $num1 and $num2 should be 15.0", 15.0, result, 0.001)
    }
}

333333333333333





pom   😊😊😊😊😊😊😊

<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>

    <groupId>com.example</groupId>
    <artifactId>myapp</artifactId>
    <version>1.0-SNAPSHOT</version>

    <dependencies>
        <!-- JUnit Dependency for Testing -->
        <dependency>
            <groupId>junit</groupId>
            <artifactId>junit</artifactId>
            <version>4.13.2</version>
            <scope>test</scope>
        </dependency>
    </dependencies>

    <build>
        <plugins>
            <!-- Maven Surefire Plugin for running tests -->
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-surefire-plugin</artifactId>
                <version>2.22.2</version>
                <configuration>
                    <redirectTestOutputToFile>false</redirectTestOutputToFile>
                    <useSystemOut>true</useSystemOut>
                </configuration>
            </plugin>
        </plugins>
    </build>
</project>




app.java😊😊😊😊😊😊

package com.example;

public class App {

    public int add(int a, int b) {
        return a + b;
    }

    public static void main(String[] args) {
        App app = new App();

        int result = app.add(2, 3);
        System.out.println("2 + 3 = " + result);

        System.out.println("Application executed successfully!");
    }
}



gradle groovy😊😊😊😊😊😊
plugins {
    id 'application'
}

application {
    mainClass = 'com.example.App'
}

repositories {
    mavenCentral()
}

dependencies {
    testImplementation 'junit:junit:4.13.2'
}

test {
    outputs.upToDateWhen { false }

    testLogging {
        events "passed", "failed", "skipped"
        exceptionFormat "full"
        showStandardStreams = true
    }
}




or



plugins {
id 'java'
}group = 'com.example'
version = '1.0-SNAPSHOT'repositories {
mavenCentral()
}dependencies {
testImplementation 'junit:junit:4.12'
}task run(type: JavaExec) {
main = 'com.example.App'
classpath = sourceSets.main.runtimeClasspath
}
444444444444
