pipeline{
    agent any
    stages{
        stage("COMPILE"){
            steps{
                script{
                    echo "Compiling the code"
                                 }
            }
        }
        stage("UNITTEST"){
            steps{
                script{
                    echo "Testing the code"
                                    }
            }
            
        }
         stage("PACKAGE"){        
            steps{
                script{
                    echo "Packaging the code"
                  
                }
            }
        }
         stage("BUILD THE DOCKER IMAGE"){      
            steps{
                script{
                    echo "BUILDING THE DOCKER IMAGE"
                  
                }
            }
        }
        stage("DEPLOY"){    
            environment{
                AWS_ACCESS_KEY_ID =credentials('jenkins_aws_access_key_id')
                AWS_ACCESS_SECRET_KEY=credentials('jenkins_aws_secret_access_key')
            }      
            steps{
                script{
                    echo "Deploying the app"
                    sh 'kubectl version'
                    sh 'kubectl get nodes'
                    sh 'kubectl create deployment nginx-deployment --image=nginx'
                                   }
            }
    }
}
}
