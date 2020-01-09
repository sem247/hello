#!/usr/bin/env groovy

import groovy.json.JsonSlurper

def mything() {
    String myjson = "{\"data\":[{\"text\":\"0.0.18\"},{\"text\":\"0.0.10\"}]}"
    List<String> artifacts = new ArrayList<String>()

    try {
//        def artifactsUrl = "http://localhost:8081/data-items.json"
//        def artifactsObjectRaw = ["curl", "-s", "-H", "accept: application/json", "-k", "--url", "${artifactsUrl}"].execute().text
        def jsonSlurper = new JsonSlurper()
        def artifactsJsonObject = jsonSlurper.parseText(myjson)
        def dataArray = artifactsJsonObject.data
        for(item in dataArray) {
            artifacts.add(item.text)
        }
    } catch (Exception e) {
        print "There was a problem " + e.message
    }

    return artifacts
}


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
                type: 'PT_SINGLE_SELECT',
                groovyScript: "${mything}",
                descriptionGroovyScript: "Descriptions Script"
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