allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}

// 1. Configure all subprojects to have a namespace and compatible SDK
subprojects {
    afterEvaluate {
        if (project.hasProperty("android")) {
            val android = project.extensions.getByName("android")
            if (android is com.android.build.gradle.BaseExtension) {
                // Force a namespace if one isn't provided (Fixes isar_flutter_libs)
                if (android.namespace == null) {
                    val groupName = "io.github.ceakins.gridwalker.${project.name.replace("-", "_")}"
                    android.namespace = groupName
                }
                android.compileSdkVersion(35)
            }
        }
    }

    project.configurations.all {
        resolutionStrategy.eachDependency {
            if (requested.group == "androidx.core" && requested.name == "core") {
                useVersion("1.13.1")
            }
        }
    }
}

// 2. Critical: Evaluation depends on app must come AFTER configuration hooks
subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
