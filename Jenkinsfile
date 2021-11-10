pipeline{

    agent any 
    tools{
        jdk 'java'
        maven 'mymaven'
    }
 
    environment{
        NEW_VERSION='1.4.0'
    }
    stages{
       
    
     stage("compalition"){

         steps{
            script{
               echo "compiling the code"
               git 'https://github.com/gopi-chand-vst-au4/addressbook.git'
               sh 'mvn compile'


            }
        }
        
    }
    stage(unittest){

        when{
            expression{
                BRANCH_NAME =='b1'
            }
        }

        steps{
            script{
        echo "run the test unit"
        sh 'mvn test'
    }
        }
        post{
            always{
                junit 'target/surefire-reports/*.xml'
            }
        }

    }
    stage("package"){
        steps{
            script{
        echo "Building the app"
        echo "building version ${NEW_VERSION}"
        sh 'mvn package'
           }

    }

    }
    stage("deploy"){
        when{
            expression{
                BRANCH_NAME =='master'
            }
        }
        steps{
            script{
                echo "deploying the app"
                echo "deploying ${NEW_VERSION}"
            }
        }
    }

    }

    

}
