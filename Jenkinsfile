#!/usr/bin/env groovy

pipeline {
    agent { label "master" }

    options {
        disableConcurrentBuilds()
    }

    parameters {
        string(
                name: 'MY_BRANCH_NAME',
                defaultValue: 'develop',
                description: 'Which branch to deploy'
        )
        choice(
                name: 'MY_VERSION',
                choices: '2.0.0',
                description: 'My version'
        )
        extendedChoice(
                name: 'PROJECT',
                defaultValue: '',
                description: 'Select something',
                visibleItemCount: 5,
                type: 'PT_SINGLE_SELECT',
                groovyScript: '''
                    List<String> artifacts = new ArrayList<String>()
                    def dataArray = ['A', 'B']
                    for(item in dataArray) {
                        artifacts.add(item.text)
                    }
                    return artifacts
                '''
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