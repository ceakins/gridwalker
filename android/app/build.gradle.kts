plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "org.gridwalker.gridwalker"
    compileSdk = 36
    ndkVersion = "28.1.13356709"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "org.gridwalker.gridwalker"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = 23
        targetSdk = 35
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            // Read signing config from environment variables (CI) or local properties
            val isCi = System.getenv("CI") == "true"
            if (isCi) {
                signingConfig = signingConfigs.create("release") {
                    keyAlias = System.getenv("ANDROID_KEY_ALIAS")
                    keyPassword = System.getenv("ANDROID_KEY_PASSWORD")
                    storeFile = file("${project.rootDir}/release.jks")
                    storePassword = System.getenv("ANDROID_KEYSTORE_PASSWORD")
                }
            } else {
                signingConfig = signingConfigs.getByName("debug")
            }
            
            minifyEnabled = false
            shrinkResources = false
        }
    }
}

flutter {
    source = "../.."
}
