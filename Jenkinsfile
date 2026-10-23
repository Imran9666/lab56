pipeline {
 agent { label 'any' }
 options {
 disableConcurrentBuilds()
 timeout(time: 10, unit: 'MINUTES')
 }
 stages {
 stage('Build and run') {
 steps {
 sh 'bash web-app.sh'
 }
 }
 }
}
