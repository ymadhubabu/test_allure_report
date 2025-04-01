pipeline {
    agent {
        docker { image 'python:3' }
    }
    stages {
        stage('activate env') {
            steps {
                sh 'pip3 install -r requirements.txt' 
            }
        }
        stage('run tests') {
            steps {
                sh 'pytest -v -s tests/test_users.py --alluredir allure-results' 
            }
        }
        stage('publish allure report') {
            steps {
                sh 'allure generate --single-file allure-results' 
                allure includeProperties: false, jdk: '', results: [[path: 'allure-results']]
                emailext attachmentsPattern: 'allure-report/index.html', body: 'Pls find the attachment for test reports', subject: 'automation reports', to: 'ymadhubabu@gmail.com'
            }
        }   
        stage('email allure report') {
            steps {
                emailext attachmentsPattern: 'allure-report/index.html', body: 'Pls find the attachment for test reports', subject: 'automation reports', to: 'ymadhubabu@gmail.com'
            }
        }   
    }
}
