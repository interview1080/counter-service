pipeline { 
    environment { 
        registry = "interview1080/counter" 
        registryCredential = 'dockerhub' 
        dockerImage = '' 
    }
    agent any 
    stages { 
		stage('Clone gitrepo') {
			steps {
				git branch: 'dev',
					credentialsId: 'interview1080',
					url: 'https://github.com/interview1080/counter-service.git'
				sh "ls -lat"
			}
		}
        stage('Build image') { 
            steps { 
                script { 
                    dockerImage = docker.build registry + ":$BUILD_NUMBER" 
                }
            } 
        }
        stage('Deploy image') { 
            steps { 
                script { 
                    docker.withRegistry( '', registryCredential ) { 
                        dockerImage.push() 
                    }
                } 
            }
        } 
        stage('Cleaning up') { 
            steps { 
                sh "docker rmi $registry:$BUILD_NUMBER" 
            }
        } 
    }
}
