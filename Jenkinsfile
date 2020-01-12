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
                name: 'MY_PROJECT',
                type: 'PT_SINGLE_SELECT',
                groovyScript: '''
                    List<String> artifacts = new ArrayList<String>()
                    def dataArray = ['A', 'B']
                    for(item in dataArray) {
                        artifacts.add(item.text)
                    }
                    return artifacts
                ''',
                defaultValue: 'B',
                defaultGroovyScript: '''
                    List<String> defaultArtifacts = new ArrayList<String>()
                    def dataArray2 = ['B']
                    for(dItem in dataArray2) {
                        defaultArtifacts.add(dItem.text)
                    }
                    return defaultArtifacts                    
                ''',
                descriptionGroovyScript: 'Just a test',
                visibleItemCount: 6,
                description: 'Select something'
        )
    }

    stages {
        stage('Initialize') {
            steps {
                sh '''
                    echo "Selected branch name = ${MY_BRANCH_NAME}"
                    echo "Selected version = ${MY_VERSION}"
                    echo "Selected project = ${MY_PROJECT}"
                    echo "PATH = ${PATH}"
                '''
            }
        }
    }
}