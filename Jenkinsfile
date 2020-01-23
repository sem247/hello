#!/usr/bin/env groovy

import groovy.json.JsonSlurper

def getVersionFromFile() {
    String path = pwd()
    String jsonString = new File("${path}/VERSION.json").text
    def jsonSlurper = new JsonSlurper()
    def jsonObject = jsonSlurper.parseText(jsonString)
    return jsonObject.version
}

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
        extendedChoice(
                name: 'MY_VERSION',
                type: 'PT_SINGLE_SELECT',
                groovyScript: '''
                    import groovy.json.JsonSlurper
                    String path = getClass().protectionDomain.codeSource.location.path
                    String currentDir = new File(".").getAbsolutePath()
                    List<String> values = new ArrayList<String>()
                    def jsonSlurper = new JsonSlurper()
                    values.add(path)
                    values.add(currentDir)
                    return values as String[]
                ''',
                description: 'Our version'
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
                    echo "PATH = ${PATH}"
                '''
            }
        }
    }
}