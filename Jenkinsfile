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
        
    }
}
