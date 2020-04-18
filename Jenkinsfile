node {
    def app 
   
    stage('Clone repository') {
        /* Cloning the Repository to our Workspace */
            checkout scm

    }   

    stage('Linting') {
      
        sh 'tidy -q -e *.html'

        
    }
    stage('Build docker image') {
       
            app = docker.build("omaroovee/inmemorydb")
    }
    stage('Push to dockerhub') {
            docker.withRegistry('https://registry.hub.docker.com', 'docker-hub') {
                app.push("${env.BUILD_NUMBER}")
                app.push("latest")
            }
    }
       

    stage('Deploying to EKS') {
        echo 'Deploying to AWS...'
        sh './scripts/create_infra.sh'
    }

    stage("Cleaning up") {
      echo 'Cleaning up...'
      sh "docker system prune"
    }

    stage("Cleaning Docker up") {
      
        sh "echo 'Cleaning Docker up'"
        sh "docker system prune"
    
        
    }
}

    