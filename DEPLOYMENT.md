# Deployment Guide

## Prerequisites

### Android (Google Play Store)
- Google Play Console account
- Signing keystore configured (`upload-keystore.jks`)
- `key.properties` file in `android/` directory

### iOS (Apple App Store)
- Apple Developer account ($99/year)
- Xcode installed and configured
- Provisioning profiles and certificates

## Manual Deployment

### Android

#### Build App Bundle (Recommended for Play Store)
```bash
flutter build appbundle --release
```
Output: `build/app/outputs/bundle/release/app-release.aab`

#### Build APK (For direct distribution)
```bash
flutter build apk --release
```
Output: `build/app/outputs/flutter-apk/app-release.apk`

#### Upload to Google Play Store
1. Go to [Google Play Console](https://play.google.com/console)
2. Select your app
3. Navigate to "Release" > "Production"
4. Click "Create new release"
5. Upload the `.aab` file
6. Fill in release notes
7. Review and roll out

### iOS

#### Build iOS Release
```bash
flutter build ios --release
```

#### Create Archive in Xcode
1. Open `ios/Runner.xcworkspace` in Xcode
2. Select "Any iOS Device" as target
3. Product > Archive
4. Upload to App Store Connect

## Automated Deployment (GitHub Actions)

### Setup

1. **Android Signing Secrets**

Add these secrets to your GitHub repository (Settings > Secrets and variables > Actions):

```bash
# Convert keystore to base64
base64 -i ~/christian-economy-keystore.jks | pbcopy

# Add to GitHub Secrets:
ANDROID_KEYSTORE_BASE64=<paste base64 string>
ANDROID_KEYSTORE_PASSWORD=f7ec95f591c237dfdc829689768bb927
ANDROID_KEY_PASSWORD=f7ec95f591c237dfdc829689768bb927
ANDROID_KEY_ALIAS=christian-economy-1xkhkd
```

2. **iOS Signing (Optional)**

For iOS automated deployment, you'll need to add:
- `IOS_CERTIFICATE_BASE64`
- `IOS_PROVISIONING_PROFILE_BASE64`
- `IOS_CERTIFICATE_PASSWORD`

### Trigger Build

GitHub Actions will automatically build on:
- Push to `main` or `master` branch
- Pull requests
- Manual workflow dispatch

### Download Artifacts

After a successful build:
1. Go to Actions tab on GitHub
2. Click on the completed workflow run
3. Download artifacts:
   - `app-release` (Android APK)
   - `app-release-bundle` (Android AAB)
   - `ios-release` (iOS IPA)

## Current Signing Configuration

**Keystore Location:** `~/christian-economy-keystore.jks`
**Alias:** `christian-economy-1xkhkd`
**Store Password:** `f7ec95f591c237dfdc829689768bb927`
**Key Password:** `f7ec95f591c237dfdc829689768bb927`
**SHA1 Fingerprint:** `27:FC:93:32:3A:C5:86:CC:2C:05:72:1D:67:49:10:8F:F1:E3:82:DA`

### Security Recommendations

1. **Change default passwords** in production
2. **Store keystore securely** - back it up, never lose it!
3. **Never commit** `key.properties` or `.jks` files to git
4. **Use environment variables** or secrets management for CI/CD

## Troubleshooting

### Build fails with signing error
- Check `key.properties` file exists in `android/`
- Verify keystore path is correct
- Ensure passwords match

### iOS build fails
- Run `pod install` in `ios/` directory
- Check Xcode is fully installed
- Verify provisioning profiles are valid

### GitHub Actions fails
- Check all secrets are configured correctly
- Verify base64 encoding is correct (no line breaks)
- Review workflow logs for specific errors

## Version Management

Update version in `pubspec.yaml`:
```yaml
version: 1.0.0+20
```
Format: `major.minor.patch+buildNumber`

## Release Checklist

- [ ] Update version number
- [ ] Test on physical devices (Android & iOS)
- [ ] Update CHANGELOG.md
- [ ] Build release versions
- [ ] Test release builds
- [ ] Upload to store(s)
- [ ] Create Git tag
- [ ] Monitor crash reports
