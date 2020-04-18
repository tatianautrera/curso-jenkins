pipeline{
    agent {
        docker{
            image 'ruby'
        }
    }
    stages{
        stage('Build'){
            steps{
                echo 'Building or Resolve Dependencies'
                sh 'bundle install'
            }
        }
        stage('Tests'){
            steps{
                echo 'Running regresion Testes'
                sh 'bundle exec cucumber -p ci'
            }
        }
        stage('UAT'){
            steps{
                echo 'wait for Users Aceeptance'
                input(message: 'Go to production?', ok:'Yes')
            }
        }
        stage('Prod'){
            steps{
                echo 'webApp is ready :)'
            }
        }
    }
}