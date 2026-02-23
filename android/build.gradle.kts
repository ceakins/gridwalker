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

subprojects {
    // 1. Force Namespace and SDK compatibility
    afterEvaluate {
        if (project.hasProperty("android")) {
            val android = project.extensions.getByName("android")
            if (android is com.android.build.gradle.BaseExtension) {
                if (android.namespace == null) {
                    android.namespace = "io.github.ceakins.gridwalker.${project.name.replace("-", "_")}"
                }
                android.compileSdkVersion(35)
            }
        }
    }

    // 2. Patch legacy Manifest files to remove the 'package' attribute (Fixes Isar conflict)
    project.tasks.withType<com.android.build.gradle.tasks.ProcessLibraryManifest>().configureEach {
        doFirst {
            val manifestFile = project.file("src/main/AndroidManifest.xml")
            if (manifestFile.exists()) {
                val content = manifestFile.readText()
                if (content.contains("package=")) {
                    val updatedContent = content.replace(Regex("package=\"[^\"]*\""), "")
                    manifestFile.writeText(updatedContent)
                    println("Pitched legacy manifest for: ${project.name}")
                }
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

subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
