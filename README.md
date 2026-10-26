# SceneSpeak AI connection-test and response fix

This update changes Gemini's **Test connection** action to use a plain-text reply check instead of requiring a JSON response. It also shows a clearer message when Gemini returns no visible text or indicates the response was blocked.

It also sets low reasoning effort for the app's short Gemini tasks and raises hard output-token limits so internal reasoning is less likely to consume the entire response budget before visible JSON is returned. The generated lesson, roleplay, tutor and speaking activities still request structured JSON because those features need specific fields.

## Update using your phone

1. Download and extract this kit.
2. Open the existing SceneSpeak repository on GitHub.
3. Replace these root-level files with the matching files from this kit:
   - `SceneSpeakMinnaN5-JSON-Import.zip`
   - `build-netlify.sh`
   - `netlify.toml`
   - `.gitignore`
4. Commit the replacement files to `main`.
5. Open Netlify → Deploys and wait for the deployment to finish. If needed, use **Clear cache and deploy site**.
6. Close old SceneSpeak tabs and reload the site. Go to Profile → AI provider, choose a model, and try **Test connection** again.

The `netlify.toml` and `build-netlify.sh` must stay paired because the project source is stored inside the ZIP at repository root.

## Notes

- This fix does not need a server or Supabase changes.
- Keep your Gemini API key out of GitHub files. Enter it inside SceneSpeak's AI settings only.
- A successful connection test confirms Gemini can return text for the selected model. If a generation activity still fails, share its exact error from the app.
- The updated source archive excludes `node_modules`, build output, and Git metadata.
