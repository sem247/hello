#!/usr/bin/env groovy
pipeline {
    agent { label "!master && !windows_slave" }

    options {
        ansiColor('xterm')
        disableConcurrentBuilds()
    }

    parameters {
        string(
                name: 'SPG_BRANCH_NAME',
                defaultValue: "develop",
                description: 'Which SPG branch to deploy'
        )
        choice(
                name: "SPG_VERSION",
                choices: "2.4.11.1",
                description: "SPG version"
        )
    }

    stages {
        stage('Initialize') {
            steps {
                sh '''
                    echo "branch name = ${SPG_BRANCH_NAME}"
                    echo "Selected SPG_VERSION = ${SPG_VERSION}"
                    echo "PATH = ${PATH}"
                '''
            }
        }
    }
}