pipeline {
    agent any

    stages {
        stage('start') {
            agent any
            steps {
                slackSend (channel: '#cicd-jenkins', message: "start")
            }
        }
        stage('ci') {
            steps {
                sh '''
                python3 -m venv venv
                . venv/bin/activate
                pip install -r requirements.txt
                pip install -e .
                pylint --ignore-path='tests' $(git ls-files '*.py')
                pytest
                coverage run -m pytest
                coverage report
                coverage html
                '''
            }
        }
        stage('deploy') {
            steps {
                sshagent (credentials: ['cicd-pem-username']) {
                    sh '''
                        ssh -o "StrictHostKeyChecking no" ec2-user@3.38.244.160 "cd CI-CD_Practice \
                         && git pull \
                         && whoami"
                    '''
                }
            }
        }
        stage('end') {
            agent any
            steps {
                slackSend (channel: '#cicd-jenkins', message: "end")
            }
        }
    }
}
