# SceneSpeak AI TypeScript Build Fix

This patch fixes the TypeScript errors from the Netlify build:

`Type '"low"' is not assignable to type 'ThinkingLevel | undefined'. Did you mean 'ThinkingLevel.LOW'?`

The app now imports `ThinkingLevel` from `@google/genai` and uses `ThinkingLevel.LOW` at each of the three `thinkingConfig` call sites.

## Update from a phone

1. Extract this kit on your phone if your file manager supports ZIP extraction.
2. Open the existing GitHub repository `muhammed-rabeeh/SceneSpeak`.
3. Replace these repository-root files with those in this kit:
   - `SceneSpeakMinnaN5-JSON-Import.zip`
   - `build-netlify.sh`
   - `netlify.toml`
   - `.gitignore`
4. Commit the changes to `main`.
5. Open Netlify → Deploys and wait for the new deploy. If no deploy starts, trigger **Clear cache and deploy site**.

Keep the build script and TOML together: Netlify extracts the app ZIP and builds the extracted `SceneSpeakApp` folder.

## Scope

This is a compile fix only. It does not change your learning data, Supabase schema, or Gemini API key. Continue entering your Gemini key in SceneSpeak's settings; never commit it to GitHub.

## Validation limits

The source ZIP archive was generated and checked for integrity. A full `npm run build` could not be verified in this environment because `npm install` timed out; Netlify's next build will be the authoritative compilation check.
