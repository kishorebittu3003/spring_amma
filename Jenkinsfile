pipeline {
    agent any
    stages {
        stage('scm') {
            steps {
                git branch: 'master', url:'https://github.com/osandadeshan/sonarqube-maven-example.git'        
            }
        }
        stage('build') {
            steps {
                withSonarQubeEnv('SONAR_SELF_HOSTED') {
                    sh  'mvn clean package sonar:sonar'

                }
                
            }
        }
         stage ('Exec Maven') {
            steps {
                rtMavenRun (
                    tool: MAVEN_TOOL, // Tool name from Jenkins configuration
                    pom: 'maven-examples/maven-example/pom.xml',
                    goals: 'clean install',
                    deployerId: "MAVEN_DEPLOYER"
                )
            }
        }
        
    }
}
