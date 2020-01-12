#!/usr/bin/env groovy

pipeline {
    agent any

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
                    import groovy.json.JsonSlurper
                    List<String> artifacts = new ArrayList<String>()
                    def jsonSlurper = new JsonSlurper()
                    def artifactsJsonObject = jsonSlurper.parseText('{"imageIds":[{"imageDigest":"sha256:99c6","imageTag":"v1.13.8"},{"imageDigest":"sha256:99c6","imageTag":"v1.13.7"},{"imageDigest":"sha256:4a1c","imageTag":"v1.13.6"}]}')
                    def dataArray = artifactsJsonObject.imageIds
                    for(item in dataArray) {
                        artifacts.add(item.imageTag)
                    }
                    return artifacts as String[]
                ''',
                defaultValue: '',
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