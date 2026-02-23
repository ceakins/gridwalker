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
    project.evaluationDependsOn(":app")
}

// Use plugin hooks to configure Android subprojects without using afterEvaluate
subprojects {
    plugins.withType<com.android.build.gradle.BasePlugin> {
        val android = project.extensions.getByType<com.android.build.gradle.BaseExtension>()
        android.compileSdkVersion(35)
        
        if (android.namespace == null) {
            android.namespace = "org.gridwalker.${project.name.replace("-", "_")}"
        }
    }
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
