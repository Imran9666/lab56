pipeline {
 agent { label 'cmp6237-vm' }
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
 stage('Test') {
 steps {
 sh 'bash test-app.sh'
 }
 }
 }
}