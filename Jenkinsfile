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
                    sh 'mvn test'
                }
            }
            post{
                always{
                    junit 'target/surefire-reports/*.xml'
                }
            }
        }
         stage("PACKAGE"){        
            steps{
                script{
                    echo "Packaging the code"
                    sh 'mvn package'
                }
            }
        }
         stage("BUILD THE DOCKER IMAGE"){      
            steps{
                script{
                    echo "BUILDING THE DOCKER IMAGE"
                   withCredentials([usernamePassword(credentialsId: 'docker-hub', passwordVariable: 'PASS', usernameVariable: 'USER')]) {
                        sh 'sudo docker build -t devopstrainer/java-mvn-privaterepo:$BUILD_NUMBER .'
                        sh 'sudo sudo docker login -u $USER -p $PASS'
                        sh 'sudo docker push devopstrainer/java-mvn-privaterepo:$BUILD_NUMBER'
                }
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
                    sh 'kubectl get nodes'
                    sh 'kubectl create deployment nginx-deployment --image=nginx'
                                   }
            }
    }
}
    }