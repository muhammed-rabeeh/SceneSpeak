# SceneSpeak Productivity & Cloud-Sync Upgrade Kit

This update builds on the latest SceneSpeak project with dark mode, a daily practice loop, a purpose-based learning planner, gamification that rewards consistent practice without penalizing rest days, and optional Supabase account sync.

## New and improved features

- **Theme:** Light, dark, or follow the device/system appearance from Profile. A sun/moon button toggles light and dark quickly.
- **Daily practice:** Home has today's practice target, estimated practice time, a streak indicator, learner level, and XP.
- **Personal learning path:** Pick a reason for learning Japanese (travel, everyday conversation, JLPT, work/study, media, foundations), a target, a timeline from one month to three years, daily minutes, and study days per week. SceneSpeak estimates the required pace and suggests a gentler timeline when the plan looks demanding.
- **Milestones:** Guided skill steps link to scenes, listening, speaking, kanji, grammar, kana, Minna and JLPT N5 practice. XP is a motivational progress signal, not a proficiency certification. N4–N1 are long-term roadmaps that need matching-level course content.
- **Optional Supabase sync:** Sign up/sign in from Profile. Upload a full local learning backup from the device with current progress, then sign in on another device and merge. No custom API server is required. The current sync is deliberately manual, not continuous background sync.
- **Safer database access:** `supabase/scenespeak_cloud_sync.sql` creates a backup table, enables Row Level Security, and limits each signed-in account to its own row. The front end uses a public Supabase publishable/legacy anon key only; never put a service-role/secret key in Netlify's `VITE_*` variables.
- Existing content remains: 25 Minna companion lessons, JLPT N5 practice, 123-kanji trainer, 12 scene modules, real microphone speaking, Memory-to-Mouth, offline-first IndexedDB, and JSON backup/restore.

## Publish this on your existing Netlify setup using a phone

1. Download/extract this ZIP on your phone using its file manager or ZIP app.
2. Open your existing GitHub repository. At the repository root, replace the existing `SceneSpeakMinnaN5-JSON-Import.zip` with the same-named nested ZIP from this kit.
3. Keep `build-netlify.sh`, `netlify.toml`, and `.gitignore` at the repository root. They should replace the old files of the same names.
4. Commit the changes. Netlify will build the source from the nested ZIP and publish `dist`.
5. If you want cloud sync, follow `SceneSpeakApp/docs/supabase-cloud-sync.md` in the source archive. You must set `VITE_SUPABASE_URL` and `VITE_SUPABASE_ANON_KEY` in Netlify's environment variables and redeploy; otherwise cloud sync remains disabled and local practice still works.
6. After the deploy says Published, close old SceneSpeak tabs/windows and reload the app. No local data is intentionally cleared by this update. Before enabling cloud sync, download a local JSON backup.

## Source project

`SceneSpeakMinnaN5-JSON-Import.zip` contains a `SceneSpeakApp/` folder with the full project, including source, documentation, the Supabase SQL, and `.env.example`.

## Validation status

The 18 TypeScript/TSX source and test files passed TypeScript syntax transpilation with zero syntax diagnostics, and `package.json`/the Supabase dependency were checked. The full dependency-based TypeScript typecheck, test suite, and production build could not be run in this environment because the npm install attempt timed out. Netlify must run the actual install and production build. If its deploy fails, share the Netlify build log and the exact error so it can be fixed.
