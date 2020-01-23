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
                    def artifactsUrl = "http://my-wiremock:6060/get/versions"
                    def jsonString = ["curl", "--url", "${artifactsUrl}"].execute().text
                    def jsonSlurper = new JsonSlurper()
                    def artifactsJsonObject = jsonSlurper.parseText(jsonString)
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
                    echo "New version is = ${new_version}"
                    echo "PATH = ${PATH}"
                '''
            }
        }
    }
}