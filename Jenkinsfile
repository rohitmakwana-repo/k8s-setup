pipeline{
    agent any
    tools{
        maven '3.6.0'
    }
     
     
    stages{
        stage('SCM Checkout'){
            steps{
                git branch: 'main', url: 'https://github.com/rohitmakwana-repo/k8s-setup.git'
            }
        }
        stage('Build') {
            steps {
                sh 'mvn --version'
                sh 'mvn clean install'
            }
        }
        stage('Docker Build and Tag') {
           steps {
              
                sh 'docker build -t k8swebapp:latest .' 
                sh 'docker tag k8swebapp rohitmakwana/k8swebapp:latest'
                //sh 'docker tag samplewebapp nikhilnidhi/samplewebapp:$BUILD_NUMBER'
               
          }
        }
        stage('Publish image to Docker Hub') {
          
            steps {
                withDockerRegistry(credentialsId: 'dockerHubID', url: '') {
                sh  'docker push rohitmakwana/k8swebapp:latest'
                //  sh  'docker push nikhilnidhi/samplewebapp:$BUILD_NUMBER' 
        }
                  
          }
        }
        stage('Run Docker container on Jenkins Agent') {
             
            steps 
   {
                sh "docker run -d -p 8002:8080 rohitmakwana/k8swebapp"
 
            }
        }
        //stage('Run Docker container on remote hosts') {
          
          //  steps {
           //     sh "docker -H ssh://jenkins@172.31.28.25 run -d -p 8003:8080 nikhilnidhi/samplewebapp"
 
            //}
        //}
    }
        
        
}