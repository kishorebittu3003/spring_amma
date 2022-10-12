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
                 {
                    sh  'mvn clean package '

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
        stage ('Publish build info') {
            steps {
                rtPublishBuildInfo (
                    serverId: "ARTIFACTORY_SERVER"
                )
            }
        }
        
    }
}
