pipeline{
    agent any
    tools{
        jdk 'myjava'
        maven 'mymaven'
    }
    
    stages{
        stage("COMPILE"){
          
            steps{
                script{
                    echo "Compiling the code"
                    sh 'mvn compile'
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
            
            steps{
                script{
                    echo "Deploying the app"
                                   }
            }
    }
}
    }
