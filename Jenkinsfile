#!/usr/bin/env groovy
pipeline {
    agent { label "master" }

    options {
        disableConcurrentBuilds()
    }

    parameters {
        string(
                name: 'MY_BRANCH_NAME',
                defaultValue: "develop",
                description: 'Which branch to deploy'
        )
        choice(
                name: "MY_VERSION",
                choices: "2.0.0",
                description: "My version"
        )
    }

    stages {
        stage('Initialize') {
            steps {
                sh '''
                    echo "Selected branch name = ${MY_BRANCH_NAME}"
                    echo "Selected version = ${MY_VERSION}"
                    echo "PATH = ${PATH}"
                '''
            }
        }
    }
}