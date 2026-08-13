# Keep all audio_service and just_audio_background classes intact
# so runtime string-based resource lookups (getIdentifier) work in release
-keep class com.ryanheise.** { *; }
-keep class androidx.media.** { *; }
-keep class androidx.media3.** { *; }

# Prevent R8 from removing getIdentifier calls used to look up drawables by name
-keepclassmembers class android.content.res.Resources {
    public int getIdentifier(java.lang.String, java.lang.String, java.lang.String);
}
