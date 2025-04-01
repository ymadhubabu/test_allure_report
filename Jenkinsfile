pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                script {
                    docker.build('your-image-name')
                }
            }
        }
        stage('Run') {
            steps {
                script {
                    docker.image('your-image-name').inside {
                        sh 'pytest -v -s tests/test_users.py --alluredir allure-results'
                        sh 'allure generate --single-file allure-results' 
                        allure includeProperties: false, jdk: '', results: [[path: 'allure-results']]
                        emailext attachmentsPattern: 'allure-report/index.html', body: 'Pls find the attachment for test reports', subject: 'automation reports', to: 'ymadhubabu@gmail.com'
                    }
                }
            }
        }
    }
}

    
